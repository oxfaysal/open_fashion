import 'package:flutter/material.dart';
import 'package:open_fashion/core/style/text_style.dart';

class HeadlineText extends StatelessWidget {
  const HeadlineText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: AppTextStyle.textBlack18w400SP4,
    );
  }
}
