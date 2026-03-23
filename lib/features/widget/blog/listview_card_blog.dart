import 'package:flutter/material.dart';
import '../../../core/style/text_style.dart';

class ListviewCardBlog extends StatelessWidget {
  const ListviewCardBlog({
    super.key,
    required this.img,
    required this.title,
    required this.date,
    required this.onPress,
    required this.desc,
  });

  final String img;
  final String title;
  final String desc;
  final String date;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            flex: 4,
            child: Image.network(
              img,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              height: 160,
              width: double.infinity,
            ),
          ),

          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title.toUpperCase(), maxLines: 2, style: AppTextStyle.textBlack14w400SP2),
                SizedBox(height: 12,),
                Text(desc, maxLines: 4, style: AppTextStyle.textBlack14w400),
                SizedBox(height: 12,),
                Text(date, style: AppTextStyle.text55Grey12w400),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
