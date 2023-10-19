import 'package:flutter/material.dart';
import '../../../models/category_model.dart';
import '../../../utils/constant.dart';
import '../widgets/product_category_slider_widget.dart';
import '../widgets/product_list_widget.dart';

class AllProductsScreen extends StatelessWidget {
  static const String routeName = 'all_product_screen';

  const AllProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<String> categories = ['Semua', 'Daily', 'Bills', 'Entertainment'];
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 70.0,
        backgroundColor: const Color(0xff396EB0),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 30.0,
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Semua Produk',
          style: TextStyle(fontSize: Constant.fontTitle, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductCategorySliderWidget(size: size, categories: categories),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Favorit Saya',
                      style: TextStyle(fontSize: Constant.fontSemiBig),
                    ),
                    ProductListWidget(
                      size: size,
                      productCategory: myFavorite,
                    ),
                    SizedBox(
                      height: size.height * 0.012,
                    ),
                    const Text(
                      'Daily',
                      style: TextStyle(fontSize: Constant.fontSemiBig),
                    ),
                    ProductListWidget(
                      size: size,
                      productCategory: daily,
                    ),
                     SizedBox(
                      height: size.height * 0.012,
                    ),
                    const Text(
                      'Bills',
                      style: TextStyle(fontSize: Constant.fontSemiBig),
                    ),
                    ProductListWidget(
                      size: size,
                      productCategory: bills,
                    ),
                     SizedBox(
                      height: size.height * 0.012,
                    ),
                    const Text(
                      'Games',
                      style: TextStyle(fontSize: Constant.fontSemiBig),
                    ),
                    ProductListWidget(
                      size: size,
                      productCategory: entertainment,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
