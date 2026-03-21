import 'package:flutter/material.dart';

import '../../../core/style/text_style.dart';

class FollowUs extends StatelessWidget {
  const FollowUs({super.key, required this.img, required this.title});

  final String img;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: ClipRRect(
        child: SizedBox(
          height: 180,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,

            children: [
              Transform(
                transform: Matrix4.identity()..scale(1.12),
                alignment: Alignment.center,
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                  alignment: const Alignment(-0.0, -1.1),
                  color: Colors.grey,
                  colorBlendMode: BlendMode.saturation,
                ),
              ),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 60,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Color(0xFF000000), Colors.transparent],
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 10,
                left: 10,
                child: Text(title, style: AppTextStyle.textWhite14w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
