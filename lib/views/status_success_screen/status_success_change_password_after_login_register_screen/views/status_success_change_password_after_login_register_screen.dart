import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:payoll/widgets/bottom_nav_bar.dart';
import '../../../../../utils/constant.dart';

class StatusSuccessChangePasswordAfterLoginRegisterScreen
    extends StatefulWidget {
  static String routeName =
      'status-success-change-password-after-login-register';

  const StatusSuccessChangePasswordAfterLoginRegisterScreen({super.key});

  @override
  State<StatusSuccessChangePasswordAfterLoginRegisterScreen> createState() =>
      _StatusSuccessChangePasswordAfterLoginRegisterScreenState();
}

class _StatusSuccessChangePasswordAfterLoginRegisterScreenState
    extends State<StatusSuccessChangePasswordAfterLoginRegisterScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController checkLottieController;

  @override
  void initState() {
    openStatusSuccessAfterLoginRegister();

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

  openStatusSuccessAfterLoginRegister() async {
    var durasiStatusBerhasil = const Duration(seconds: 6);
    return Timer(durasiStatusBerhasil, () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavBar(
              pageIndex: 2,
            ),
          ),
          (route) => false);
    });
  }

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
            ],
          ),
        ),
      ),
    );
  }
}
