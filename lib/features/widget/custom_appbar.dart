import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../core/color/colors.dart';
import '../../core/style/text_style.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.bgColor});

  final Color? bgColor;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Open \nFashion",
        style: AppTextStyle.logo,
        textAlign: TextAlign.right,
      ),
      actionsPadding: EdgeInsets.only(right: 10),
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      scrolledUnderElevation: 0,
      backgroundColor: widget.bgColor ?? AppColors.whiteColor,
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, "/menu_expand");
        },
        icon: Icon(
          LucideIcons.textAlignStart,
          color: AppColors.iconColor,
          size: 24,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(LucideIcons.search, size: 24, color: AppColors.iconColor),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/cart");
          },
          icon: Icon(
            LucideIcons.shoppingBag,
            color: AppColors.blackColor,
            size: 24,
          ),
        ),
      ],
    );
  }


}
