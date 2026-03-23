import 'package:flutter/material.dart';
import 'package:open_fashion/core/color/colors.dart';
import 'package:open_fashion/features/widget/custom_appbar.dart';

class CategoryProductDetailsScreen extends StatefulWidget {
  const CategoryProductDetailsScreen({super.key});

  @override
  State<CategoryProductDetailsScreen> createState() => _CategoryProductDetailsScreenState();
}

class _CategoryProductDetailsScreenState extends State<CategoryProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(),
      body: Center(child: Text(product['id'].toString(), style: TextStyle(fontSize: 20),), ),
    );
  }
}
