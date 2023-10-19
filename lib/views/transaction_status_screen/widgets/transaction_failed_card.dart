import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:payoll/providers/transaction_provider.dart';
import 'package:payoll/utils/constant.dart';
import 'package:provider/provider.dart';
import '../../../models/product_model.dart';

class TransactionFailedCard extends StatelessWidget {
  const TransactionFailedCard(
      {Key? key, required this.size, required this.data})
      : super(key: key);

  final Size size;
  final Data? data;

  @override
  Widget build(BuildContext context) {
    final transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);
    final transaction = transactionProvider.transactionModel;
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
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    height: size.width * 0.23,
                    child: Image.network(
                      data!.iconUrl!,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.035),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * 0.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateFormat.yMMMMd().format(
                              DateTime(
                                int.parse(
                                    transaction!.updated!.substring(0, 4)),
                                int.parse(transaction.updated!.substring(5, 7)),
                                int.parse(
                                  transaction.updated!.substring(8, 10),
                                ),
                              ),
                            ),
                            style: const TextStyle(
                                fontSize: Constant.fontExtraSmall),
                          ),
                          const Icon(
                            Icons.fiber_manual_record,
                            size: 5,
                          ),
                          const Text(
                            '06:30',
                            style: TextStyle(fontSize: Constant.fontSmall),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.48,
                      child: Text(
                        'Id transaksi : ${transaction.id?.toUpperCase()}',
                        style:
                            const TextStyle(fontSize: Constant.fontExtraSmall),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1.5,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: size.width * 0.04,
                      width: size.width * 0.04,
                      child: Image.asset('assets/icons/failed-icon.png'),
                    ),
                    SizedBox(width: size.width * 0.02),
                    const Text(
                      'Transaksi Gagal',
                      style: TextStyle(
                        fontSize: Constant.fontSmall,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  data!.description!,
                  style: const TextStyle(
                      fontSize: Constant.fontBig, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Color(0xFFEDEDED),
                          borderRadius: BorderRadius.all(Radius.circular(7.0))),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                            child: Text(
                          'PULSA & DATA',
                          style: TextStyle(fontSize: Constant.fontExtraSmall),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.035,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFFF9F2F2),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          border: Border.all(
                              color: const Color(0xFFFF4129), width: 2)),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
                        child: Center(
                          child: Text(
                            'Gagal',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 10.0,
                                color: Color(0xFFFF4129)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Text(
                  'Detail Transaksi',
                  style: TextStyle(
                      fontSize: Constant.fontBig, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: size.height * 0.014,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.45,
                          child: const Text(
                            'Id Transaksi',
                            style: TextStyle(fontSize: Constant.fontRegular),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.47,
                          child: Text(
                            transaction.id!.toUpperCase(),
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                fontSize: Constant.fontSemiSmall,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.013,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.45,
                          child: const Text(
                            'Nama Produk',
                            style: TextStyle(fontSize: Constant.fontRegular),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.35,
                          child: Text(
                            data!.description!,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                fontSize: Constant.fontRegular,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.013,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.45,
                          child: const Text(
                            'Nomor Handphone',
                            style: TextStyle(fontSize: Constant.fontRegular),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.35,
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
                      height: size.height * 0.013,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.45,
                          child: const Text(
                            'Metode pembayaran',
                            style: TextStyle(fontSize: Constant.fontRegular),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.35,
                          child: Text(
                            (transaction.xenditPaymentMethod! == '')
                                ? '-'
                                : transaction.xenditPaymentMethod!,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                fontSize: Constant.fontRegular,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.013,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.45,
                          child: const Text(
                            'Kode Promosi',
                            style: TextStyle(fontSize: Constant.fontRegular),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.35,
                          child: const Text(
                            '-',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: Constant.fontRegular,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.013,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.45,
                          child: const Text(
                            'Harga',
                            style: TextStyle(fontSize: Constant.fontRegular),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.35,
                          child: Text(
                            Constant.oCcy
                                .format(transaction.productPrice!)
                                .toString(),
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                fontSize: Constant.fontRegular,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.013,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.45,
                          child: const Text(
                            'Biaya Admin',
                            style: TextStyle(fontSize: Constant.fontRegular),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.35,
                          child: Text(
                            (transaction.adminFee! == 0)
                                ? 'Gratis!'
                                : transaction.adminFee!.toString(),
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                fontSize: Constant.fontRegular,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 30.0,
                      thickness: 1.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.38,
                          child: const Text(
                            'Total',
                            style: TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.42,
                          child: Text(
                            Constant.oCcy
                                .format(transaction.totalPrice)
                                .toString(),
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
