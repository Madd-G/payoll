import 'package:flutter/material.dart';
import 'package:payoll/utils/state/finite_state.dart';
import 'package:payoll/views/payment_screen/views/payment_screen.dart';
import 'package:provider/provider.dart';
import '../../../providers/product_provider.dart';
import '../../../utils/constant.dart';

class DataContentWidget extends StatefulWidget {
  const DataContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DataContentWidget> createState() => _DataContentWidgetState();
}

class _DataContentWidgetState extends State<DataContentWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<ProductProvider>(builder: (context, provider, _) {
        switch (provider.myState) {
          case MyState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case MyState.loaded:
            if (provider.dataProductModel == null) {
              return const Text('Sorry, your data still empty');
            } else {
              return GridView.builder(
                  shrinkWrap: true,
                  itemCount: provider.dataProductModel!.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: size.height * 0.16),
                  itemBuilder: (BuildContext context, int index) {
                    final product = provider.dataProductModel!.data![index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return Wrap(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          18.0, 10.0, 18.0, 20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: Container(
                                              width: 90.0,
                                              height: 6.0,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xFFC5C5C5),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0))),
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.02,
                                          ),
                                          Text(
                                            '${product.description}',
                                            style: const TextStyle(
                                                fontSize: Constant.fontBig,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.015,
                                          ),
                                          Text(
                                            '${product.details}',
                                            style: const TextStyle(
                                              fontSize: Constant.fontRegular,
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.03,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                'Harga',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                Constant.oCcy.format(
                                                  product.price,
                                                ),
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF396EB0)),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.03,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          PaymentScreen(
                                                            index: index,
                                                            data: product,
                                                          )));
                                            },
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Color(0xFF396EB0),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
                                              ),
                                              child: const Center(
                                                child: Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: Text(
                                                    'LANJUT KE PEMBAYARAN',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: Constant
                                                            .fontSemiBig,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0x29292914),
                                    blurRadius: 10.0,
                                    blurStyle: BlurStyle.normal,
                                    offset: Offset(0.0,
                                        0.75) // shadow direction: bottom right
                                    )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${product.description}',
                                  style: const TextStyle(
                                      fontSize: Constant.fontRegular,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Harga',
                                        style: TextStyle(
                                            fontSize: Constant.fontSemiSmall),
                                      ),
                                      Text(
                                        Constant.oCcy.format(
                                          product.price,
                                        ),
                                        style: const TextStyle(
                                            fontSize: Constant.fontSemiBig,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFF396EB0)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }
          case MyState.failed:
            return const Text('Oops, something went wrong!');
          default:
            return const SizedBox();
        }
      }),
    );
  }
}
