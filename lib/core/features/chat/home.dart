import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gpt_chat/constant/colors.dart';
import 'package:gpt_chat/core/features/chat/widget/app_bar.dart';
import 'package:gpt_chat/services/chat_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ChatUser _currentUser = ChatUser(id: '1', firstName: 'You');
  final ChatUser _chatGptUser = ChatUser(id: '2', firstName: 'GPT');

  final List<ChatMessage> _messages = [];
  bool _isLoading = false;

  Future<void> _handleSend(ChatMessage message) async {
    setState(() {
      _messages.insert(0, message);
      _isLoading = true;
    });

    try {
      final reply = await ChatService.instance.sendMessage(
        List.from(_messages),
        _currentUser,
      );
      if (!mounted) return;
      setState(() {
        _messages.insert(
          0,
          ChatMessage(
            text: reply,
            user: _chatGptUser,
            createdAt: DateTime.now(),
          ),
        );
      });
    } on OpenAIAuthError {
      if (kDebugMode) {
        print('OpenAI authentication error: Invalid API key.');
      }
      _showError('Authentication failed. Check your API key.');
    } on OpenAIRateLimitError {
      if (kDebugMode) {
        print('OpenAI rate limit error: Too many requests.');
      }
      _showError('Rate limit reached. Please wait and try again.');
    } on OpenAIServerError catch (e) {
      if (kDebugMode) {
        print('OpenAI server error: ${e.toString()}');
      }
      _showError('OpenAI server error. Please try again later.');
    } catch (e) {
      if (kDebugMode) {
        print('Error sending message: $e');
      }
      _showError('Something went wrong: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _clearChat() => setState(() => _messages.clear());

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red.shade700),
    );
  }

  @override
  void initState() {
    _messages.add(
      ChatMessage(
        text:
            'Sure! Here is a poem about the beauty of nature:\n\n'
            'In the heart of the forest, where the wildflowers bloom,\n'
            'The sun filters through leaves, casting a golden gloom.\n'
            'Rivers sing softly as they dance on their way,\n'
            'Nature’s beauty unfolds in a magical display.',
        user: _chatGptUser,
        createdAt: DateTime.now(),
      ),
    );
    _messages.add(
      ChatMessage(
        text: 'Write a poem about the beauty of nature.',
        user: _currentUser,
        createdAt: DateTime.now(),
      ),
    );
    _messages.add(
      ChatMessage(
        text: 'Hello! I am your AI assistant. How can I help you today?',
        user: _chatGptUser,
        createdAt: DateTime.now(),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: MyAppBar(onClearChat: _clearChat),
      body: DashChat(
        currentUser: _currentUser,
        messages: _messages,
        onSend: _handleSend,
        typingUsers: _isLoading ? [_chatGptUser] : [],
      ),
    );
  }
}
