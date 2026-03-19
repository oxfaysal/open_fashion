import 'package:flutter/material.dart';

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
      },
      initialRoute: "/home",
      debugShowCheckedModeBanner: false,
    );
  }
}
