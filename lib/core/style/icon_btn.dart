import 'package:flutter/material.dart';
import 'package:open_fashion/core/style/text_style.dart';

import '../color/colors.dart';

class IconBtn extends StatelessWidget {
  const IconBtn({
    super.key,
    required this.title,
    this.onPressed,
    required this.icon,
  });

  final String title;
  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.blackColor),
        onPressed: onPressed,
        icon: Icon(icon, color: AppColors.whiteColor, size: 20,),
        label: Text(title, style: AppTextStyle.textWhite16w400),
      ),
    );
  }
}
