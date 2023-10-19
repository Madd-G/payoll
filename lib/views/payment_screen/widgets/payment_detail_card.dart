import 'package:flutter/material.dart';
import 'package:payoll/providers/product_provider.dart';
import 'package:provider/provider.dart';
import '../../../models/product_model.dart';
import '../../../utils/constant.dart';

class PaymentDetailCard extends StatelessWidget {
  final int index;
  final Data? product;

  const PaymentDetailCard(
      {Key? key, required this.index, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width * 0.92,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                  color: Color(0x29292914),
                  blurRadius: 15.0,
                  blurStyle: BlurStyle.normal,
                  offset: Offset(0.0, 0.75) // shadow direction: bottom right
                  )
            ]),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 20.0),
          child: Consumer<ProductProvider>(builder: (context, provider, _) {
            return Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Detail Pembayaran',
                  style: TextStyle(
                      fontSize: Constant.fontBig, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.34,
                          child: const Text(
                            'Nama Produk',
                            style: TextStyle(fontSize: Constant.fontRegular),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.45,
                          child: Text(
                            '${product?.description}',
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                fontSize: Constant.fontRegular,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.34,
                          child: const Text(
                            'Nomor Handphone',
                            style: TextStyle(fontSize: Constant.fontRegular),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.45,
                          child: const Text(
                            '087123456789',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: Constant.fontRegular,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.34,
                          child: const Text(
                            'Harga',
                            style: TextStyle(fontSize: Constant.fontRegular),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.45,
                          child: Text(
                            '${product?.price}',
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                fontSize: Constant.fontRegular,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.34,
                          child: const Text(
                            'Biaya Admin',
                            style: TextStyle(fontSize: Constant.fontRegular),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.45,
                          child: const Text(
                            'Gratis!',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: Constant.fontRegular,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: Text(
                            'Total Pembayaran',
                            style: TextStyle(
                                fontSize: Constant.fontSemiBig,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.42,
                          child: Text(
                            Constant.oCcy.format(product?.price),
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                fontSize: Constant.fontSemiBig,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    const Text('Apakah kamu mempunyai kode promosi? '),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                              onChanged: (value) {},
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      top: 16.0, left: 20.0),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                          color: Color(0xFFEAEBEF))),
                                  filled: true,
                                  fillColor: const Color(0xFFF6F6F6),
                                  hintText: '087xxxxxxxxx',
                                  hintStyle: const TextStyle(
                                      color: Color(0xFF99A1B5)))),
                        ),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color(0xFF396EB0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: const Center(
                              child: Padding(
                                padding:
                                    EdgeInsets.fromLTRB(14.0, 12.0, 14.0, 12.0),
                                child: Text(
                                  'GUNAKAN',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Constant.fontBig,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
