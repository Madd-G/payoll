import 'dart:async';
import 'package:flutter/material.dart';
import 'package:payoll/views/home_screen/views/home_screen.dart';
import 'package:payoll/views/onboarding_screen/views/onboarding1_screen.dart';
import 'package:payoll/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import '../../../providers/product_provider.dart';
import '../../../providers/user_provider.dart';
import '../../../services/sharedServices.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash-screen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // openSplashScreen();
    startTime();
    Future.delayed(
      Duration.zero,
      () {
        final profileProvider =
            Provider.of<UserProvider>(context, listen: false);
        profileProvider.fetchProfile();
        final productProvider =
            Provider.of<ProductProvider>(context, listen: false);
        productProvider.fetchProductByCategory('pulsa');
        productProvider.fetchProductByCategory('data');
      },
    );
    super.initState();
  }

  Future<void> startTime() async {
      final prefs = SharedService();
      String? token = await prefs.getToken();
      await Future.delayed(
        const Duration(seconds: 4),
        () {
          if (token != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const BottomNavBar(pageIndex: 0),
              ),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Onboarding1(),
              ),
            );
          }
        },
      );
    }

  openSplashScreen() async {
    var durasiSplashScreen = const Duration(seconds: 2);
    return Timer(
      durasiSplashScreen,
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavBar(
                pageIndex: 0,
              ),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_with_name.png',
            )
          ],
        ),
      ),
    );
  }
}
