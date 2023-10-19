import 'package:flutter/material.dart';

class HomeScreenCarousel extends StatelessWidget {
  const HomeScreenCarousel({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    final List imageCarousel = [
      'assets/images/carousel-image-1.png',
      'assets/images/carousel-image-1.png',
      'assets/images/carousel-image-1.png',
    ];
    return SizedBox(
      height: size.height * 0.2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imageCarousel.length,
          itemBuilder: (context, index) {
            return SizedBox(
              // size: const Size(270, 0),
              child: Image.asset(
                imageCarousel[index],
              ),
            );
          }),
    );
  }
}
