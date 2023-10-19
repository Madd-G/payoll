import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:payoll/views/login_screen/views/login_screen.dart';
import '../../../../../utils/constant.dart';

class StatusSuccessRegisterScreen extends StatefulWidget {
  static String routeName = 'status-success-register-';

  const StatusSuccessRegisterScreen({super.key});

  @override
  State<StatusSuccessRegisterScreen> createState() =>
      _StatusSuccessRegisterScreenState();
}

class _StatusSuccessRegisterScreenState
    extends State<StatusSuccessRegisterScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController checkLottieController;

  @override
  void initState() {
    openStatusBerhasilRegister();

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

  openStatusBerhasilRegister() async {
    var durasiStatusBerhasil = const Duration(seconds: 6);
    return Timer(durasiStatusBerhasil, () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
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
                  style: TextStyle(
                      fontSize: Constant.fontExtraBig,
                      fontWeight: FontWeight.w600)),
              SizedBox(
                height: size.height * 0.012,
              ),
              const Text(
                  'Selamat anda telah menjadi pengguna PayOll, Happy transaksi',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Constant.fontSemiBig,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
