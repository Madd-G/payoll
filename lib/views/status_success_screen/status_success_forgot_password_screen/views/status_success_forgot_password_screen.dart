import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:payoll/views/login_screen/views/login_screen.dart';
import '../../../../../utils/constant.dart';
import '../widgets/status_success_forgot_password_button.dart';

class StatusSuccessForgotPasswordScreen extends StatefulWidget {
  static String routeName = 'status-success-forgot-password';

  const StatusSuccessForgotPasswordScreen({super.key});

  @override
  State<StatusSuccessForgotPasswordScreen> createState() =>
      _StatusSuccessForgotPasswordScreenState();
}

class _StatusSuccessForgotPasswordScreenState
    extends State<StatusSuccessForgotPasswordScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController checkLottieController;

  @override
  void initState() {
    // openStatusBerhasilRegister();

    checkLottieController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    super.initState();
  }

  @override
  void dispose() {
    checkLottieController.dispose();
    super.dispose();
  }

  // openStatusBerhasilRegister() async {
  //   var durasiStatusBerhasil = const Duration(seconds: 6);
  //   return Timer(durasiStatusBerhasil, () {
  //    Navigator.pushAndRemoveUntil(
  //                     context,
  //                     MaterialPageRoute(
  //                         builder: (context) => const BottomNavBar(
  //                           pageIndex: 0,
  //                         )),
  //                         (route) => false);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset(
                'assets/animation/check.json',
                height: size.height * 0.300,
                controller: checkLottieController,
                onLoaded: (composition) {
                  checkLottieController.forward();
                },
              ),
              const Text('Berhasil',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: Constant.fontExtraBig,
                      fontWeight: FontWeight.w600)),
              SizedBox(
                height: size.height * 0.012,
              ),
              const Text('Selamat Kata sandi berhasil di perbaharui',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Constant.fontSemiBig,
                  )),
              SizedBox(
                height: size.height * 0.040,
              ),
              StatusSuccessForgotPasswordButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, LoginScreen.routeName);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
