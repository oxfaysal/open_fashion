import 'package:flutter/material.dart';
import 'package:open_fashion/core/style/text_style.dart';

class ArrivalGridCard extends StatelessWidget {
  const ArrivalGridCard({
    super.key,
    required this.img,
    required this.title,
    required this.price,
    required this.onPress,
  });

  final String img;
  final String title;
  final String price;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 5,
        children: [
          SizedBox(height: 220, width: double.infinity, child: Image.network(img, fit: BoxFit.cover,)),
          Text(title, style: AppTextStyle.text33Grey12w400),
          Text("\$ $price", style: AppTextStyle.textPrimary15w400),
        ],
      ),
    );
  }
}
