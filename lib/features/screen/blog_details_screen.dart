import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_fashion/core/color/colors.dart';
import 'package:open_fashion/core/style/text_style.dart';
import 'package:open_fashion/features/widget/blog/slider_listView.dart';
import 'package:open_fashion/features/widget/custom_appbar.dart';
import 'package:open_fashion/features/widget/footer.dart';

class BlogDetailsScreen extends StatefulWidget {
  const BlogDetailsScreen({super.key, required this.blogPostItem});

  final Map<String, dynamic> blogPostItem;

  @override
  State<BlogDetailsScreen> createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.blogPostItem['images'][1],
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Padding(padding: EdgeInsets.all(16), child: Column(
              children: [
                Text(
                  (widget.blogPostItem['title'] ?? '').toUpperCase(),
                  maxLines: 2,
                  style: AppTextStyle.textBlack14w400,
                ),
                SizedBox(height: 12,),

                Text(
                  widget.blogPostItem['excerpt'] ?? '',
                  style: AppTextStyle.text33Grey14w400,
                ),
                SizedBox(height: 16,),
                ImageSlider(images: widget.blogPostItem['images']),
                SizedBox(height: 22,),

                Html(

                  data: widget.blogPostItem['description'],
                  style: {
                    "body": Style(
                      margin: Margins.zero,
                      fontSize: FontSize(14),
                      fontWeight: FontWeight.w400,
                      fontFamily: GoogleFonts.tenorSans().fontFamily,
                      color: AppColors.bodyGrey33Color,
                    ),
                    "a": Style(
                      fontSize: FontSize(14),
                      fontFamily: GoogleFonts.tenorSans().fontFamily,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryColor,
                      textDecoration: TextDecoration.none,
                    ),
                  },
                ),
                SizedBox(height: 22,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      spacing: 8,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage(
                            widget.blogPostItem['author']['avatar'],
                          ),
                        ),

                        Text(
                          ("Posted by ${widget.blogPostItem['author']['name']}"),
                          style: AppTextStyle.text33Grey14w400,
                        ),
                      ],
                    ),

                    Container(
                      height: 14,
                      width: 1,
                      color: AppColors.divider55Color,
                    ),

                    Text(
                      widget.blogPostItem['date'] ?? '',
                      style: AppTextStyle.text33Grey14w400,
                    ),
                  ],
                ),
                SizedBox(height: 16,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    spacing: 8,
                    children: (widget.blogPostItem['tag'] as List).map((tag) {
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
                SizedBox(height: 22,),

              ],
            ),),

            SizedBox(height: 10,),

            Footer(),

          ],
        ),
      ),
    );
  }
}
