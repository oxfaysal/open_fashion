import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key, required this.images});

  final List<dynamic> images;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ✅ Image Slider
        SizedBox(
          height: 500,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.images.length,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            itemBuilder: (context, index) {
              return Image.network(
                widget.images[index],
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
          ),
        ),

        const SizedBox(height: 10),

        // ✅ Dot Indicators
        // Dot Indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.images.length,
                (index) => Transform.rotate(
              angle: 45 * 3.14159 / 180, // ✅ 45 degree rotate
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentIndex == index ? 10 : 8,
                height: _currentIndex == index ? 10 : 8,
                decoration: BoxDecoration(
                  color: _currentIndex == index
                      ? Colors.black
                      : Colors.grey.shade400,

                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}