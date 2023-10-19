import 'package:flutter/material.dart';
import 'package:payoll/utils/constant.dart';
import 'package:payoll/views/login_screen/views/login_screen.dart';
import 'package:payoll/views/register_screen/views/register_screen.dart';
import '../widgets/pointer_bar.dart';

class Onboarding5 extends StatelessWidget {
  static const String routeName = 'onboarding-5';

  const Onboarding5({Key? key}) : super(key: key);

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
                        'assets/images/onboarding/onboarding-5.png',
                      )),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    'Self Reward',
                    style: TextStyle(
                        fontSize: Constant.fontExtraBig,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    'Nikmatin Reward dan Voucher harta karun dari kita yang haqiqi tanpa ada bayaran apapun',
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
                      PointerBar(size: size, active: false),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      PointerBar(size: size, active: false),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      PointerBar(size: size, active: true),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  SizedBox(
                    width: size.width,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RegisterScreen.routeName,
                        );
                      },
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Color(0xff396EB0))),
                      child: const Text(
                        'DAFTAR',
                        style: TextStyle(fontSize: Constant.fontSemiBig),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                    width: size.width,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, LoginScreen.routeName);
                      },
                      style: const ButtonStyle(
                          side: MaterialStatePropertyAll(
                              BorderSide(color: Color(0xff396EB0))),
                          elevation: MaterialStatePropertyAll(0),
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Color(0xFFF7F5FF))),
                      child: const Text(
                        'MASUK',
                        style: TextStyle(
                            fontSize: Constant.fontSemiBig,
                            color: Color(0xff396EB0)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
