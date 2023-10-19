import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:payoll/providers/transaction_history_provider.dart';
import 'package:payoll/utils/state/finite_state.dart';
import 'package:provider/provider.dart';
import '../../../utils/constant.dart';

class TransactionHistoryScreen extends StatefulWidget {
  static String routeName = 'transaction-history-screen';

  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        final provider =
            Provider.of<TransactionHistoryProvider>(context, listen: false);
        provider.getAllTransactionHistory();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            centerTitle: false,
            elevation: 2,
            backgroundColor: const Color(Constant.mainColor),
            title: const Text(
              'Riwayat Transaksi',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: Constant.fontTitle),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<TransactionHistoryProvider>(
              builder: (context, provider, _) {
            switch (provider.myState) {
              case MyState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case MyState.loaded:
                if (provider.transactionHistoryModel?.data == null) {
                  return const Center(child: Text('No transaction data yet'));
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: provider.transactionHistoryModel!.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      var transactionData = provider
                          .transactionHistoryModel!.data!.reversed
                          .toList()[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          height: size.height * 0.15,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: size.width * 0.150,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffFAFAFA),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Image.asset(
                                        'assets/icons/pulsa-and-data.png',
                                        height: size.height * 0.050,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.08,
                                    width: size.width * 0.4,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          transactionData.productDescription
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: Constant.fontSemiSmall,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          'Order Id: ${transactionData.id}',
                                          overflow: TextOverflow.clip,
                                          maxLines: 1,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              // '17 Dec 2022'
                                              DateFormat.yMMMMd().format(
                                                DateTime(
                                                  int.parse(transactionData
                                                      .updated!
                                                      .substring(0, 4)),
                                                  int.parse(transactionData
                                                      .updated!
                                                      .substring(5, 7)),
                                                  int.parse(
                                                    transactionData.updated!
                                                        .substring(8, 10),
                                                  ),
                                                ),
                                              ),
                                              style: const TextStyle(
                                                  fontSize: Constant.fontSmall),
                                            ),
                                            const Icon(
                                              Icons.fiber_manual_record,
                                              size: 7,
                                            ),
                                            Text(
                                              transactionData.updated!
                                                  .substring(11, 16),
                                              style: const TextStyle(
                                                  fontSize: Constant.fontSmall),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      Constant.oCcy
                                          .format(transactionData.totalPrice)
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Container(
                                      height: size.height * 0.048,
                                      width: size.width * 0.222,
                                      decoration: BoxDecoration(
                                          color:
                                              (transactionData.xenditStatus ==
                                                      'SUCCESS')
                                                  ? const Color(0xffF0F9F2)
                                                  : const Color(0xffF9F2F2),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(18.0)),
                                          border: Border.all(
                                              color: (transactionData
                                                          .xenditStatus ==
                                                      'SUCCESS')
                                                  ? const Color(0xff6EC581)
                                                  : const Color(0xffE3A1A1),
                                              width: 2.5)),
                                      child: Center(
                                          child: Text(
                                        transactionData.xenditStatus!,
                                        style: const TextStyle(fontSize: 17.0),
                                      )),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              case MyState.failed:
                return const Text('Oops, something went wrong!');
              default:
                return const SizedBox();
            }
          }),
        ),
      ),
    );
  }
}
