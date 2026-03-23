import 'package:flutter/material.dart';
import 'package:open_fashion/core/color/colors.dart';
import 'package:open_fashion/core/style/text_style.dart';

class CategoryGridCard extends StatelessWidget {
  const CategoryGridCard({
    super.key,
    required this.img,
    required this.brand,
    required this.price,
    required this.onPress,
    required this.title,
  });

  final String img;
  final String brand;
  final String title;
  final String price;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          Stack(
            children: [
              Image.network(
                img,
                fit: BoxFit.cover,
                height: 220,
                width: double.infinity,
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Icon(
                  Icons.favorite_border,
                  color: AppColors.primaryColor,
                  size: 24,
                ),
              ),
            ],
          ),
          Text(brand.toUpperCase(), maxLines: 1, style: AppTextStyle.textBlack12w400),
          Text(title, maxLines: 1, style: AppTextStyle.text33Grey12w400),
          Text("\$ $price", style: AppTextStyle.textPrimary15w400),
        ],
      ),
    );
  }
}
