import 'package:flutter/material.dart';
import 'package:open_fashion/features/widget/custom_appbar.dart';

import '../../core/color/colors.dart';
import '../../core/style/text_style.dart';

class CategoryItemsScreen extends StatefulWidget {
  const CategoryItemsScreen({super.key});

  @override
  State<CategoryItemsScreen> createState() => _CategoryItemsScreenState();
}

class _CategoryItemsScreenState extends State<CategoryItemsScreen> {

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final List<String> chips = [
      args['tab'] ?? '',
      args['category'] ?? '',
      args['item'] ?? '',
    ];

    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(child: Wrap(
        spacing: 8,
        children: chips.map((tag) {
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
      ),),
    );
  }
}
