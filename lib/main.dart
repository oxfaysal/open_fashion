import 'package:flutter/material.dart';
import 'package:open_fashion/features/screen/blog_list_screen.dart';

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
      },
      initialRoute: "/home",
      debugShowCheckedModeBanner: false,
    );
  }
}
