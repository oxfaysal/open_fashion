import 'package:flutter/material.dart';
import 'package:open_fashion/features/screen/blog_list_screen.dart';
import 'package:open_fashion/features/screen/cart_screen.dart';
import 'package:open_fashion/features/screen/category_items_screen.dart';
import 'package:open_fashion/features/screen/category_product_details_screen.dart';
import 'package:open_fashion/features/screen/menu_screen.dart';

import 'features/screen/blog_grid_screen.dart';
import 'features/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        "/home": (context) => const HomeScreen(),
        "/blog_grid": (context) => const BlogGridScreen(),
        "/blog_list": (context) => const BlogListScreen(),
        "/menu_expand": (context) => const MenuExpandScreen(),
        "/cart": (context) => const CartScreen(),
        "/category_items": (context) => const CategoryItemsScreen(),
        "/category_items_details": (context) => const CategoryProductDetailsScreen(),
      },
      initialRoute: "/home",
      debugShowCheckedModeBanner: false,
    );
  }
}
