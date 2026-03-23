import 'package:flutter/material.dart';
import 'package:open_fashion/core/color/colors.dart';
import 'package:open_fashion/core/style/text_style.dart';

class Pajination extends StatelessWidget {
  const Pajination({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blackColor,
              shape: RoundedRectangleBorder(),
              padding: EdgeInsets.zero,
            ),
            onPressed: () {},
            child: Center(
              child: Text("1", style: AppTextStyle.textWhite16w400),
            ),
          ),
        ),
        SizedBox(
          width: 40,
          height: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.capsulBgF9Color,
              shape: RoundedRectangleBorder(),
              padding: EdgeInsets.zero,
            ),
            onPressed: () {},
            child: Text("2", style: AppTextStyle.textBlack16w400),
          ),
        ),
        SizedBox(
          width: 40,
          height: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.capsulBgF9Color,
              shape: RoundedRectangleBorder(),
              padding: EdgeInsets.zero,
            ),
            onPressed: () {},
            child: Text("3", style: AppTextStyle.textBlack16w400),
          ),
        ),
        SizedBox(
          width: 40,
          height: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.capsulBgF9Color,
              shape: RoundedRectangleBorder(),
              padding: EdgeInsets.zero,
            ),
            onPressed: () {},
            child: Text("4", style: AppTextStyle.textBlack16w400),
          ),
        ),
        SizedBox(
          width: 40,
          height: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.capsulBgF9Color,
              shape: RoundedRectangleBorder(),
              padding: EdgeInsets.zero,
            ),
            onPressed: () {},
            child: Text("5", style: AppTextStyle.textBlack16w400),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.iconColor,
            size: 20,
          ),
        ),
      ],
    );
  }
}
