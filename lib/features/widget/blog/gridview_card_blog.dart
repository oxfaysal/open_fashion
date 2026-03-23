import 'package:flutter/material.dart';

import '../../../core/color/colors.dart';
import '../../../core/style/text_style.dart';

class GridviewCardBlog extends StatelessWidget {
  const GridviewCardBlog({super.key, required this.img, required this.title, required this.tag, required this.date, required this.onPress});

  final String img;
  final String title;
  final List<String> tag;
  final String date;
  final VoidCallback onPress;



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                img,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 80,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Color(0xFF000000), Colors.transparent],
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: Text(title.toUpperCase(), maxLines: 2, style: AppTextStyle.textWhite14w400SP2),
              ),

              Positioned(
                top: 20,
                right: 20,
                child: Icon(Icons.bookmark_border, color: AppColors.whiteColor, size: 24,),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                child: Wrap(
                  spacing: 8,
                  children: tag.take(2).map((tag) {
                    return ChoiceChip(
                      label: Text(tag, style: AppTextStyle.tagTextDesign),
                      selected: false,
                      onSelected: (_) {},
                      backgroundColor: AppColors.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: AppColors.divider55Color.withAlpha(30)),
                      ),
                      showCheckmark: false,
                    );
                  }).toList(),
                ),
              ),

              Text(date, style: AppTextStyle.text55Grey12w400,),
            ],
          )

        ],
      ),
    );
  }
}
