import 'package:flutter/material.dart';

class ProductCategorySliderBottomSheetFilterWidget extends StatelessWidget {
  const ProductCategorySliderBottomSheetFilterWidget({
    Key? key,
    required this.size,
    required this.categories,
  }) : super(key: key);

  final Size size;
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.085,
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
                        Border.all(color: const Color(0xFFA9A9A9), width: 0.5)),
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
