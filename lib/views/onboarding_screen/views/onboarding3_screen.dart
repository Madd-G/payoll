import 'package:flutter/material.dart';
import 'package:payoll/utils/constant.dart';
import 'package:payoll/views/onboarding_screen/widgets/lewati_button.dart';
import '../widgets/lanjutkan_button.dart';
import '../widgets/pointer_bar.dart';
import 'onboarding4_screen.dart';

class Onboarding3 extends StatelessWidget {
  static const String routeName = 'onboarding-3';

  const Onboarding3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: size.height * 0.4,
                      width: size.width * 0.8,
                      child: Image.asset(
                        'assets/images/onboarding/onboarding-3.png',
                      )),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    'Perlindungan Extra',
                    style: TextStyle(
                        fontSize: Constant.fontExtraBig,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    'Sepenting itu kamu buat kita, selama proses pembayaran kamu kita pantau 7x24 jam dengan keamanan sistem kelas dunia ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PointerBar(size: size, active: false),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      PointerBar(size: size, active: false),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      PointerBar(size: size, active: true),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      PointerBar(size: size, active: false),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      PointerBar(size: size, active: false),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  LanjutkanButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, Onboarding4.routeName, (route) => false);
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const LewatiButton()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
