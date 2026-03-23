import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:open_fashion/core/style/text_style.dart';
import 'package:open_fashion/features/widget/divider.dart';

import '../../core/color/colors.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {

  bool _isBlogGrid = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        LucideIcons.twitter,
                        size: 22,
                        color: AppColors.iconColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        LucideIcons.instagram,
                        size: 22,
                        color: AppColors.iconColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        LucideIcons.youtube,
                        size: 22,
                        color: AppColors.iconColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              CustomDivider(width: 50),
              SizedBox(height: 25),
              Center(
                child: Column(
                  children: [
                    Text(
                      "loomixdev@gmail.com",
                      style: AppTextStyle.text33Grey16w400,
                    ),
                    Text(
                      "+880 1833 732555",
                      style: AppTextStyle.text33Grey16w400,
                    ),
                    Text(
                      "08:00 - 22:00 - Everyday",
                      style: AppTextStyle.text33Grey16w400,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              CustomDivider(width: 50),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text("About", style: AppTextStyle.textBlack16w400),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Contact",
                        style: AppTextStyle.textBlack16w400,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (_isBlogGrid) {
                          Navigator.pushNamed(context, "/blog_grid");
                        } else {
                          Navigator.pushNamed(context, "/blog_list");
                        }
                        setState(() {
                          _isBlogGrid = !_isBlogGrid; // toggle
                        });
                      },
                      child: Text("Blog", style: AppTextStyle.textBlack16w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.only(top: 15, bottom: 30),
          decoration: BoxDecoration(
            color: AppColors.copyrightBgColor.withAlpha(40),
          ),
          child: Center(
            child: Text(
              "Copyright © Faysal - All Rights Reserved.",
              style: AppTextStyle.text55Grey12w400,
            ),
          ),
        ),
      ],
    );
  }
}
