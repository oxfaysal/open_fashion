import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:open_fashion/core/color/colors.dart';
import 'package:open_fashion/core/style/text_style.dart';
import 'package:open_fashion/features/widget/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 560,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/home_header_img.png"),
                  fit: BoxFit.cover,
                  alignment: AlignmentGeometry.xy(-0.95, 0),
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 220),
                child: Column(
                  children: [
                    Text(
                      "Luxury \n  Fashion \n& Accessories".toUpperCase(),
                      style: AppTextStyle.bodyText40w700,
                    ),
                    Spacer(),

                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.blackColor.withAlpha(100),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Explore Collection".toUpperCase(),
                        style: AppTextStyle.textWhite16w400,
                      ),
                    ),

                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
