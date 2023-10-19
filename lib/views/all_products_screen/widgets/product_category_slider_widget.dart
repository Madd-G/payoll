import 'package:flutter/material.dart';

class ProductCategorySliderWidget extends StatelessWidget {
  const ProductCategorySliderWidget({
    Key? key,
    required this.size,
    required this.categories,
  }) : super(key: key);

  final Size size;
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
      height: size.height * 0.090,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Color(0x29292914),
            blurRadius: 5.0,
            blurStyle: BlurStyle.outer,
            offset: Offset(0.0, 0.25) // shadow direction: bottom right
            )
      ]),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    border:
                        Border.all(color: const Color(0xFFA9A9A9), width: size.width * 0.005)),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 18.0),
                  child: Text(
                    categories[index],
                    style: const TextStyle(fontSize: 16.0),
                  ),
                )),
              ),
            );
          }),
    );
  }
}
