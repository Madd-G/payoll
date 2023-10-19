import 'package:flutter/material.dart';
import '../../../models/category_model.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({
    Key? key,
    required this.size,
    required this.productCategory,
  }) : super(key: key);

  final Size size;
  final List<CategoryModel> productCategory;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: productCategory.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, mainAxisExtent: size.height * 0.182),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              children: [
                Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: const BoxDecoration(
                      color: Color(0xffFAFAFA),
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.asset(productCategory[index].image),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                SizedBox(
                    height: 50.0,
                    width: 70.0,
                    child: Text(
                      productCategory[index].productName,
                      textAlign: TextAlign.center,
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
