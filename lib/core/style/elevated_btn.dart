import 'package:flutter/material.dart';
import 'package:open_fashion/core/color/colors.dart';
import 'package:open_fashion/core/style/text_style.dart';

class ElevatedBtn extends StatelessWidget {
  const ElevatedBtn({
    super.key,
    required this.title,
    this.onPressed,
    required this.icon,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blackColor,
        shape: RoundedRectangleBorder(),
        padding: EdgeInsets.only(bottom: 35, top: 25)
      ),
      onPressed: onPressed,
      label: Text(title, style: AppTextStyle.textWhite16w400),
      icon: Icon(icon, size: 24, color: AppColors.whiteColor),
    );
  }
}
