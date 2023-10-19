import 'package:flutter/material.dart';
import 'package:payoll/views/onboarding_screen/widgets/lanjutkan_button.dart';
import 'package:payoll/views/onboarding_screen/widgets/lewati_button.dart';
import '../../../utils/constant.dart';
import '../widgets/pointer_bar.dart';
import 'onboarding3_screen.dart';

class Onboarding2 extends StatelessWidget {
  static const String routeName = 'onboarding-2';

  const Onboarding2({Key? key}) : super(key: key);

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
                        'assets/images/onboarding/onboarding-2.png',
                      )),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    'Pas Dikantong',
                    style: TextStyle(
                        fontSize: Constant.fontExtraBig,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    'Buat kamu yang spesial nya melebihi martabak, Nikmati produk dengan harga terbaik dan promo - promo yang menarik perhatian kantong kamu',
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
                      PointerBar(size: size, active: true),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      PointerBar(size: size, active: false),
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
                      Navigator.pushNamedAndRemoveUntil(context, Onboarding3.routeName, (route) => false);
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
