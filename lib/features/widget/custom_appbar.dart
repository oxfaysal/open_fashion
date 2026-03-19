import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../core/color/colors.dart';
import '../../core/style/text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Open \nFashion", style: AppTextStyle.logo, textAlign: TextAlign.right,),
      actionsPadding: EdgeInsets.only(right: 10),
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      backgroundColor: AppColors.secondaryColor,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(LucideIcons.textAlignStart, color: AppColors.iconColor, size: 24),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            LucideIcons.search,
            size: 24,
            color: AppColors.iconColor,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            LucideIcons.shoppingBag,
            color: AppColors.blackColor,
            size: 24,
          ),
        ),
      ],
    );
  }


  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}