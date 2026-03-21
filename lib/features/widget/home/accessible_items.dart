import 'package:flutter/material.dart';

import '../../../core/style/text_style.dart';

class AccessibleItems extends StatelessWidget {
  const AccessibleItems({super.key, required this.img, required this.title});

  final String img;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Column(
        children: [
          SizedBox(
              height: 45,
              width: 45,
              child: Image.asset(img, )),
          SizedBox(height: 10,),
          Text(title, style: AppTextStyle.tagTextDesign, textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
