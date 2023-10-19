import 'package:flutter/material.dart';
import 'package:payoll/providers/transaction_provider.dart';
import 'package:payoll/views/transaction_status_screen/widgets/transaction_success_card.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../models/product_model.dart';
import '../../../utils/constant.dart';
import '../../../widgets/bottom_nav_bar.dart';
import '../widgets/transaction_failed_card.dart';
import '../widgets/transaction_in_progress_card.dart';

enum Status { inProgress, success, failed }

class TransactionStatusScreen extends StatefulWidget {
  static const String routeName = 'transaction_status_screen';
  final int? index;
  final Data? product;
  final String? paymentUrl;

  const TransactionStatusScreen({
    Key? key,
    this.index,
    this.product,
    this.paymentUrl,
  }) : super(key: key);

  @override
  State<TransactionStatusScreen> createState() =>
      _TransactionStatusScreenState();
}

class _TransactionStatusScreenState extends State<TransactionStatusScreen> {
  // var transactionStatus = Status.inProgress;

  @override
  void initState() {
    _launchUrl(widget.paymentUrl);
    super.initState();
  }

  Future<void> _launchUrl(String? url) async {
    if (!await launchUrl(Uri.parse(url!), mode: LaunchMode.inAppWebView)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(Constant.mainColor),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: size.height * 0.35,
              ),
              Expanded(
                child: Container(
                  width: size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Consumer<TransactionProvider>(
                            builder: (context, provider, _) {
                          final transaction = provider.transactionModel;
                          return SizedBox(
                            height: size.height * 0.1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                (transaction?.xenditStatus == 'PENDING' ||
                                        transaction?.xenditStatus == 'FAILED')
                                    ? Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(8.0)),
                                            border: Border.all(
                                                color: const Color(
                                                    Constant.mainColor))),
                                        child: const Center(
                                            child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: Text(
                                            'BANTUAN?',
                                            style: TextStyle(
                                                color: Color(
                                                  Constant.mainColor,
                                                ),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.0),
                                          ),
                                        )),
                                      )
                                    : Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(8.0)),
                                                  border: Border.all(
                                                      color: const Color(
                                                          Constant.mainColor))),
                                              child: const Center(
                                                  child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10.0),
                                                child: Text(
                                                  'BANTUAN?',
                                                  style: TextStyle(
                                                      color: Color(
                                                        Constant.mainColor,
                                                      ),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13.0),
                                                ),
                                              )),
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.03,
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Color(0xFF396EB0),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0)),
                                              ),
                                              child: const Center(
                                                  child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10.0),
                                                child: Text(
                                                  'BAGIKAN',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13.0),
                                                ),
                                              )),
                                            ),
                                          )
                                        ],
                                      ),
                                Expanded(
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const BottomNavBar(
                                                      pageIndex: 0,
                                                    )),
                                            (route) => false);
                                      },
                                      child: const Text(
                                        'Kembali ke Beranda',
                                        style: TextStyle(
                                            color: Color(
                                              0xFF396EB0,
                                            ),
                                            fontWeight: FontWeight.w700,
                                            fontSize: Constant.fontRegular),
                                      )),
                                )
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Consumer<TransactionProvider>(builder: (context, provider, _) {
            final transaction = provider.transactionModel;
            return Positioned(
              top: 75.0,
              left: 0.0,
              right: 0.0,
              child: (transaction?.xenditStatus == 'PENDING')
                  ? TransactionInProgressCard(size: size, data:widget.product,)
                  : (transaction?.xenditStatus == 'SUCCESS')
                      ? TransactionSuccessCard(size: size, data: widget.product,)
                      : TransactionFailedCard(size: size, data: widget.product,),
            );
          })
        ],
      ),
    );
  }
}
