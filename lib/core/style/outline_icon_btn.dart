import 'package:flutter/material.dart';
import 'package:open_fashion/core/style/text_style.dart';

import '../color/colors.dart';

class OutlineIconBtn extends StatelessWidget {
  const OutlineIconBtn({
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
      width: 200,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: AppColors.btnBorderColor),
          shape: RoundedRectangleBorder(),
        ),
        onPressed: onPressed,
        icon: Icon(icon, color: AppColors.blackColor, size: 20,),
        iconAlignment: IconAlignment.end,
        label: Text(title, style: AppTextStyle.textBlack16w400),
      ),
    );
  }
}
