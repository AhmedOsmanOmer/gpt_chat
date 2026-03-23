import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gpt_chat/constant/colors.dart';
import 'package:gpt_chat/core/features/start/widget/grid_view.dart';
import 'package:gpt_chat/core/features/start/widget/start_chat_button.dart';
import 'package:gpt_chat/core/widgets/spacing_widgets.dart';
import 'package:gpt_chat/routing/routes.dart';

class Starting extends StatefulWidget {
  const Starting({super.key});

  @override
  State<Starting> createState() => _StartingState();
}

class _StartingState extends State<Starting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(50),
            Center(child: Image.asset('assets/bot.png', scale: 2.0.sp)),
            InkWell(
              onTap: () => context.push(Routes.homeScreen),
              child: const StartChatButton(),
            ),
            verticalSpace(20),
            const MyGridView(),
          ],
        ),
      ),
    );
  }
}
