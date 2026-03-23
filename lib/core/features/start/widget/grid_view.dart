import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpt_chat/constant/colors.dart';
import 'package:responsive_grid/responsive_grid.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  static const List<String> _icons = [
    'assets/poem.png',
    'assets/translate.png',
    'assets/code.png',
    'assets/email.png',
    'assets/recipe.png',
    'assets/correct.png',
    'assets/solve.png',
    'assets/business.png',
    'assets/summery.png',
  ];

  static const List<String> _labels = [
    'Write a poem',
    'Translate Anything',
    'Write a Code',
    'Write an Email',
    'Give me Recipe',
    'Correct Text',
    'Solve a Problem',
    'Business ideas',
    'Summarize text',
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridList(
      desiredItemWidth: 100.w,
      shrinkWrap: true,
      children: List.generate(_labels.length, (index) {
        return Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.13,
          padding: EdgeInsets.all(5.w),
          margin: EdgeInsets.all(10.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.w),
            border: Border.all(color: tealColor, width: 3.w),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(_icons[index], scale: 9.sp),
              Text(
                _labels[index],
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        );
      }),
    );
  }
}
