import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gpt_chat/constant/colors.dart';
import 'package:gpt_chat/constant/text_styles.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onClearChat;

  const MyAppBar({super.key, this.onClearChat});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: tealColor),
        onPressed: () => context.pop(),
      ),
      title: const Text('New Chat', style: whiteTextStyle),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.delete_outline, color: tealColor),
          tooltip: 'Clear chat',
          onPressed: onClearChat,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
