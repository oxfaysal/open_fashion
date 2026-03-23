import 'package:flutter/material.dart';
import 'package:open_fashion/api/blog_category.dart';
import 'package:open_fashion/api/blog_post.dart';
import 'package:open_fashion/core/style/headline_text.dart';
import 'package:open_fashion/core/style/outline_icon_btn.dart';
import 'package:open_fashion/features/widget/custom_appbar.dart';
import 'package:open_fashion/features/widget/divider.dart';
import 'package:open_fashion/features/widget/footer.dart';

import '../../core/color/colors.dart';
import '../../core/style/text_style.dart';
import '../widget/blog/gridview_card_blog.dart';
import 'blog_details_screen.dart';

class BlogGridScreen extends StatefulWidget {
  const BlogGridScreen({super.key});

  @override
  State<BlogGridScreen> createState() => _BlogGridScreenState();
}

class _BlogGridScreenState extends State<BlogGridScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            HeadlineText(text: "Blog"),
            SizedBox(height: 10),
            CustomDivider(width: 50),
            SizedBox(height: 16),
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 15, right: 15),
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 8,
                children: blogCategory.map((tag) {
                  return ChoiceChip(
                    label: Text(tag, style: AppTextStyle.tagTextDesign),
                    selected: false,
                    onSelected: (_) {},
                    backgroundColor: AppColors.capsulBgF9Color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    showCheckmark: false,
                  );
                }).toList(),
              ),
            ),
            
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: blogPost.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(12),
                  child: GridviewCardBlog(
                    img: blogPost[index]['images'][0],
                    title: blogPost[index]['title'],
                    tag: List<String>.from(blogPost[index]['tag'] ?? []),
                    date: blogPost[index]['readTime'],
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlogDetailsScreen(
                            blogPostItem:
                                blogPost[index], // index দিয়ে একটা item পাঠাচ্ছি
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.39,
                mainAxisSpacing: 0,
              ),
            ),
            SizedBox(height: 16),
            OutlineIconBtn(
              title: "Load more",
              icon: Icons.add,
              onPressed: () {},
            ),
            SizedBox(height: 30),
            Footer(),
          ],
        ),
      ),
    );
  }
}
