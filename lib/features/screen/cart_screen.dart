import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:open_fashion/core/style/elevated_btn.dart';

import '../../core/color/colors.dart';
import '../../core/style/text_style.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final bool _isCartEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Close Button
              Padding(
                padding: const EdgeInsets.all(12),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, size: 24),
                ),
              ),

              const SizedBox(height: 20),

              Text("CART", style: AppTextStyle.tabActive18w400),

              _isCartEmpty == true
                  ? Expanded(
                      child: Center(
                        child: Text("You have no items in your Shopping Bag."),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ElevatedBtn(
        title: "Continue shopping",
        icon: LucideIcons.shoppingBag,
        onPressed: () {},
      ),
    );
  }
}
