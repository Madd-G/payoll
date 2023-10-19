import 'package:flutter/material.dart';
import 'package:payoll/providers/bottom_nav_bar_provider.dart';
import 'package:payoll/providers/change_password_provider.dart';
import 'package:payoll/providers/product_provider.dart';
import 'package:payoll/providers/sign_in_provider.dart';
import 'package:payoll/providers/sign_up_provider.dart';
import 'package:payoll/providers/transaction_history_provider.dart';
import 'package:payoll/providers/transaction_provider.dart';
import 'package:payoll/providers/update_profile_provider.dart';
import 'package:payoll/providers/user_provider.dart';
import 'package:payoll/utils/constant.dart';
import 'package:payoll/views/all_products_screen/views/all_products_screen.dart';
import 'package:payoll/views/change_password_screen/for_after_login_register/views/change_password_after_login_register_screen.dart';
import 'package:payoll/views/change_password_screen/for_forgot_password/views/change_password_forgot_password_screen.dart';
import 'package:payoll/views/forgot_password_screen/views/forgot_password.dart';
import 'package:payoll/views/home_screen/views/home_screen.dart';
import 'package:payoll/views/login_screen/views/login_screen.dart';
import 'package:payoll/views/onboarding_screen/views/onboarding1_screen.dart';
import 'package:payoll/views/onboarding_screen/views/onboarding2_screen.dart';
import 'package:payoll/views/onboarding_screen/views/onboarding3_screen.dart';
import 'package:payoll/views/onboarding_screen/views/onboarding4_screen.dart';
import 'package:payoll/views/onboarding_screen/views/onboarding5_screen.dart';
import 'package:payoll/views/otp_screen/for_after_login_register/views/otp_after_login_register_screen.dart';
import 'package:payoll/views/otp_screen/for_forgot_password/views/otp_forgot_password_screen.dart';
import 'package:payoll/views/payment_screen/views/payment_screen.dart';
import 'package:payoll/views/profile_screen/views/profile_screen.dart';
import 'package:payoll/views/pulsa_data_screen/views/pulsa_data_screen.dart';
import 'package:payoll/views/transaction_history_screen/views/transaction_history_screen.dart';
import 'package:payoll/views/splash_screen/views/splash_screen.dart';
import 'package:payoll/views/status_success_screen/status_success_change_password_after_login_register_screen/views/status_success_change_password_after_login_register_screen.dart';
import 'package:payoll/views/transaction_status_screen/views/transaction_status_screen.dart';
import 'package:provider/provider.dart';
import 'views/edit_account_screen/views/edit_account_screen.dart';
import 'views/register_screen/views/register_screen.dart';
import 'views/status_success_screen/status_success_forgot_password_screen/views/status_success_forgot_password_screen.dart';
import 'views/status_success_screen/status_success_register_screen/views/status_success_register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomNavBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UpdateProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChangePasswordProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionHistoryProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: const Color(Constant.mainColor),
        ),
        // home: const SplashScreen(),
        home: const HomeScreen(),
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          Onboarding1.routeName: (context) => const Onboarding1(),
          Onboarding2.routeName: (context) => const Onboarding2(),
          Onboarding3.routeName: (context) => const Onboarding3(),
          Onboarding4.routeName: (context) => const Onboarding4(),
          Onboarding5.routeName: (context) => const Onboarding5(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          RegisterScreen.routeName: (context) => const RegisterScreen(),
          ForgotPasswordScreen.routeName: (context) =>
              const ForgotPasswordScreen(),
          OtpForgotPasswordScreen.routeName: (context) =>
              const OtpForgotPasswordScreen(),
          OtpAfterLoginRegisterScreen.routeName: (context) =>
              const OtpAfterLoginRegisterScreen(),
          ChangePasswordForgotPasswordScreen.routeName: (context) =>
              const ChangePasswordForgotPasswordScreen(),
          ChangePasswordAfterLoginRegisterScreen.routeName: (context) =>
              const ChangePasswordAfterLoginRegisterScreen(),
          StatusSuccessRegisterScreen.routeName: (context) =>
              const StatusSuccessRegisterScreen(),
          StatusSuccessForgotPasswordScreen.routeName: (context) =>
              const StatusSuccessForgotPasswordScreen(),
          StatusSuccessChangePasswordAfterLoginRegisterScreen.routeName:
              (context) =>
                  const StatusSuccessChangePasswordAfterLoginRegisterScreen(),
          AllProductsScreen.routeName: (context) => const AllProductsScreen(),
          PulsaDataScreen.routeName: (context) => const PulsaDataScreen(),
          PaymentScreen.routeName: (context) => const PaymentScreen(),
          TransactionStatusScreen.routeName: (context) =>
              const TransactionStatusScreen(),
          EditAccountScreen.routeName: (context) => const EditAccountScreen(),
          TransactionHistoryScreen.routeName: (context) =>
              const TransactionHistoryScreen(),
        },
      ),
    );
  }
}
