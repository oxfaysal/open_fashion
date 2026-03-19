import 'package:flutter/material.dart';
import 'package:open_fashion/core/color/colors.dart';
import 'package:open_fashion/core/style/text_style.dart';

class ElevatedBtn extends StatelessWidget {
  const ElevatedBtn({super.key, required this.title, this.onPressed});

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.blackColor),
        onPressed: onPressed,
        child: Text(title, style: AppTextStyle.textWhite16w400),
      ),
    );
  }
}
