import 'package:flutter/material.dart';
import 'package:open_fashion/core/color/colors.dart';
import 'package:open_fashion/core/style/text_style.dart';

class CategoryListCard extends StatelessWidget {
  const CategoryListCard({
    super.key,
    required this.img,
    required this.brand,
    required this.title,
    required this.price,
    required this.rating,
    required this.size,
    required this.onPress,
  });

  final String img;
  final String brand;
  final String title;
  final String price;
  final String rating;
  final List<String> size;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                img,
                fit: BoxFit.cover,
                height: 150,
                width: 110,
              ),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brand.toUpperCase(),
                    maxLines: 1,
                    style: AppTextStyle.textBlack16w400,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    maxLines: 2,
                    style: AppTextStyle.text33Grey16w400,
                  ),
                  const SizedBox(height: 4),
                  Text("\$ $price", style: AppTextStyle.textPrimary15w400),
                  const SizedBox(height: 8),

                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 14),
                      Text(
                        " $rating Ratings",
                        style: AppTextStyle.text55Grey12w400,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 5,
                        children: [
                          Text("Size", style: AppTextStyle.text55Grey12w400),
                          Wrap(
                            spacing: 5,
                            children: size.map((s) => Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColors.bodyGrey33Color,
                                        width: 0.5,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        s,
                                        style: AppTextStyle.text55Grey12w400,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.favorite_border,
                        color: AppColors.primaryColor,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
