import 'package:flutter/material.dart';
import 'package:payoll/views/change_password_screen/for_forgot_password/views/change_password_forgot_password_screen.dart';
import 'package:payoll/views/otp_screen/for_forgot_password/widgets/otp_input_forgot_password.dart';
import '../../../../utils/constant.dart';
import '../widgets/otp_app_bar_forgot_password.dart';
import '../widgets/otp_send_forgot_password_button.dart';

class OtpForgotPasswordScreen extends StatefulWidget {
  static const String routeName = 'otp-screen-forgot-password';

  const OtpForgotPasswordScreen({super.key});

  @override
  State<OtpForgotPasswordScreen> createState() =>
      _OtpForgotPasswordScreenState();
}

class _OtpForgotPasswordScreenState extends State<OtpForgotPasswordScreen> {
  final GlobalKey formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: otpAppBarForgotPassword(context),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Kode OTP telah kami kirimkan ke',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: Constant.fontSemiRegular)),
            const Text('F*********@gmail.com',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: Constant.fontSemiRegular,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: size.height * 0.036,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                OtpInputForgotPassword(),
                OtpInputForgotPassword(),
                OtpInputForgotPassword(),
                OtpInputForgotPassword(),
                OtpInputForgotPassword(),
                OtpInputForgotPassword(),
              ],
            ),
            SizedBox(
              height: size.height * 0.020,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Tidak mendapat kode?'),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Kirim Ulang',
                      style: TextStyle(color: Color(Constant.mainColor)),
                    )),
              ],
            ),
            OtpVerificationForgotPasswordButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, ChangePasswordForgotPasswordScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
