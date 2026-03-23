import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:gpt_chat/constant/api_constant.dart';

class ChatService {
  ChatService._();

  static final ChatService instance = ChatService._();

  late final OpenAI _openAI = OpenAI.instance.build(
    token: openAiApiKey,
    baseOption: HttpSetup(
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 30),
    ),
    enableLog: false,
  );

  Future<String> sendMessage(
    List<ChatMessage> messages,
    ChatUser currentUser,
  ) async {
    final history = messages.map((m) {
      final role = m.user.id == currentUser.id ? 'user' : 'assistant';
      return <String, dynamic>{'role': role, 'content': m.text};
    }).toList();

    final request = ChatCompleteText(
      model: Gpt4oMiniChatModel(),
      messages: history,
      maxToken: 500,
    );

    final response = await _openAI.onChatCompletion(request: request);

    if (response == null || response.choices.isEmpty) {
      throw Exception('Empty response from OpenAI.');
    }

    final content = response.choices.first.message?.content;
    if (content == null || content.trim().isEmpty) {
      throw Exception('No content in response.');
    }

    return content.trim();
  }
}
