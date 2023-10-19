import 'package:flutter/material.dart';
import 'package:payoll/views/home_screen/widgets/service_card_widget.dart';
import 'package:provider/provider.dart';
import '../../../providers/user_provider.dart';
import '../../../utils/constant.dart';
import '../widgets/home_screen_carousel.dart';
import '../widgets/transaction_history_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xff396EB0),
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 100.0,
        backgroundColor: const Color(0xff396EB0),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selamat Datang',
              style: TextStyle(fontSize: Constant.fontSemiSmall),
            ),
            SizedBox(
              height: size.height * 0.008,
            ),
            Consumer<UserProvider>(builder: (context, provider, _) {
              final user = provider.profileModel;
              return Container(
                height: size.height * 0.050,
                width: size.width * 0.55,
                child: Text(
                  '${user?.name}',
                  style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700),
                ),
              );
            }),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 30.0, 15.0, 10.0),
            child: Image.asset(
              'assets/icons/logo.png',
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: size.height * 0.21,
                ),
                Container(
                  width: size.width,
                  decoration: const BoxDecoration(
                      color: Color(0xffFAFAFA),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 132.0,bottom: 0, right: 16.0, left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Belanja Makin Hemat!!!',
                              style: TextStyle(
                                  fontSize: Constant.fontSemiBig,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: size.height * 0.015,
                            ),
                            const Text(
                              'Dapetin diskon dan harga spesial nya di PayOll sekarang sebelum kehabisan!!!',
                              style: TextStyle(fontSize: Constant.fontRegular),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      HomeScreenCarousel(
                        size: size,
                      ),
                      SizedBox(
                        height: size.height * 0.012,
                      ),
                      TransactionHistorySection(size: size),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
                top: 5.0,
                left: 0.0,
                right: 0.0,
                child: ServiceCardWidget(size: size)),
          ],
        ),
      ),
    );
  }
}
