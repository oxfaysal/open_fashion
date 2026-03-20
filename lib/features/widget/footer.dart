import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:open_fashion/core/style/text_style.dart';
import 'package:open_fashion/features/widget/divider.dart';

import '../../core/color/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(LucideIcons.twitter,
                    color: AppColors.blackColor,
                    size: 20,
                  ),
                  Icon(LucideIcons.instagram,
                    color: AppColors.blackColor,
                    size: 20,
                  ),
                  Icon(LucideIcons.youtube,
                    color: AppColors.blackColor,
                    size: 20,
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomDivider(width: 50),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Text(
                      "support@openui.design",
                      style: AppTextStyle.text33Grey16w400,
                    ),
                    Text("+60 825 876", style: AppTextStyle.text33Grey16w400),
                    Text(
                      "08:00 - 22:00 - Everyday",
                      style: AppTextStyle.text33Grey16w400,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              CustomDivider(width: 50),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text("About", style: AppTextStyle.textBlack16w400),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("Contact", style: AppTextStyle.textBlack16w400),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("Blog", style: AppTextStyle.textBlack16w400),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.copyrightBgColor,
          ),
          child: Center(child: Text("Copyright© OpenUI All Rights Reserved.", style: AppTextStyle.text55Grey12w400,)),
        ),
      ],
    );
  }
}
