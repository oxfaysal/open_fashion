import 'package:flutter/material.dart';
import 'package:open_fashion/core/color/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 0.5,
          width: width,
          color: AppColors.divider55Color,
        ),
        SizedBox(width: 2,),
        Transform.rotate(
          angle: 45 * 3.14159 / 180, // 45 ডিগ্রি rotate
          child: Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.divider55Color, width: 0.5)
            ),
          ),
        ),
        SizedBox(width: 2,),
        Container(
          height: 0.5,
          width: width,
          color: AppColors.divider55Color,
        ),

      ],
    );
  }
}
