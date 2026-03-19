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
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(side: BorderSide(color: AppColors.btnBorderColor),),
        onPressed: onPressed,
        icon: Icon(icon, color: AppColors.whiteColor, size: 20,),
        label: Text(title, style: AppTextStyle.textWhite16w400),
      ),
    );
  }
}
