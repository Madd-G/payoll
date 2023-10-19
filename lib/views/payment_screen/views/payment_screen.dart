import 'package:flutter/material.dart';
import 'package:payoll/providers/product_provider.dart';
import 'package:payoll/views/payment_screen/widgets/payment_detail_card.dart';
import 'package:payoll/views/transaction_status_screen/views/transaction_status_screen.dart';
import 'package:provider/provider.dart';
import '../../../models/product_model.dart';
import '../../../providers/transaction_provider.dart';
import '../../../providers/user_provider.dart';
import '../../../utils/constant.dart';
import '../../../utils/state/finite_state.dart';

class PaymentScreen extends StatefulWidget {
  static const String routeName = 'payment_screen';
  final int? index;
  final Data? data;

  const PaymentScreen({Key? key, this.index, this.data}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    final provider = Provider.of<TransactionProvider>(context, listen: false);
    provider.addListener(
      () {
        if (provider.myState == MyState.failed) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 1),
              content: Text(
                'Transaction Failed',
              ),
            ),
          );
        } else if (provider.myState == MyState.loaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 1),
              content: Text(
                'Berhasil Masuk',
              ),
            ),
          );
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => TransactionStatusScreen(
                        index: widget.index,
                        product: widget.data,
                        paymentUrl: provider.transactionModel?.xenditPaymentUrl,
                      )),
              (route) => false);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionProvider>(context, listen: false);
    final user = Provider.of<UserProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 70.0,
        backgroundColor: const Color(0xff396EB0),
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            size: 30.0,
          ),
        ),
        title: const Text(
          'Pembayaran',
          style: TextStyle(
              fontSize: Constant.fontTitle, fontWeight: FontWeight.w700),
        ),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: size.height * 0.15,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Color(0xff396EB0),
                ),
              ),
              Container(
                height: size.height * 0.18,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 0.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total Pembayaran',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Consumer<ProductProvider>(
                              builder: (context, provider, _) {
                            return Text(
                              Constant.oCcy.format(widget.data?.price),
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF396EB0)),
                            );
                          }),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      GestureDetector(
                        onTap: () {
                          provider.transaction(
                              customerId: user.profileModel?.id,
                              productCode: widget.data?.code,
                              successRedirectUrl:
                                  'https://ariesta.club/success',
                              failureRedirectUrl: 'https://ariesta.club/fail');
                        },
                        child: Consumer<TransactionProvider>(
                            builder: (context, provider, _) {
                          if (provider.myState == MyState.loading) {
                            return const CircularProgressIndicator();
                          } else {
                            return Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xFF396EB0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'PILIH METODE PEMBAYARAN',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Constant.fontSemiBig,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            );
                          }
                        }),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: 5.0,
            right: 0.0,
            left: 0.0,
            child: PaymentDetailCard(
              index: widget.index!,
              product: widget.data,
            ),
          ),
        ],
      ),
    );
  }
}
