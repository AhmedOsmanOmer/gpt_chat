import 'package:gpt_chat/constant/colors.dart';
import 'package:gpt_chat/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StartChatButton extends StatelessWidget {
  const StartChatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: 330.w,
      decoration: BoxDecoration(
          color: tealColor, borderRadius: BorderRadius.circular(20.w)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageIcon(
            const AssetImage('assets/message.png'),
            color: Colors.white,
            size: 30.sp,
          ),
          
          horizontalSpace(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Start Chat With AI',
                style: GoogleFonts.libreBaskerville(
                  color: Colors.white,
                  fontSize: 18.sp,
                ),
              ),
              Text(
                'Ask What You Want And Get Answer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                ),
              )
            ],
          ),
          horizontalSpace(20),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
