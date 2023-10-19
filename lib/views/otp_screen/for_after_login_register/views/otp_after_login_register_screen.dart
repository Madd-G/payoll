import 'package:flutter/material.dart';
import 'package:payoll/views/status_success_screen/status_success_change_password_after_login_register_screen/views/status_success_change_password_after_login_register_screen.dart';
import '../../../../utils/constant.dart';
import '../widgets/otp_app_bar_after_login_register.dart';
import '../widgets/otp_input_after_login_register.dart';
import '../widgets/otp_send_after_login_register_button.dart';

class OtpAfterLoginRegisterScreen extends StatefulWidget {
  static const String routeName = 'otp-screen-after-login-register';

  const OtpAfterLoginRegisterScreen({super.key});

  @override
  State<OtpAfterLoginRegisterScreen> createState() =>
      _OtpAfterLoginRegisterScreenState();
}

class _OtpAfterLoginRegisterScreenState
    extends State<OtpAfterLoginRegisterScreen> {
  final GlobalKey formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: otpAppBarAfterLoginRegister(context),
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
                OtpInputAfterLoginRegister(),
                OtpInputAfterLoginRegister(),
                OtpInputAfterLoginRegister(),
                OtpInputAfterLoginRegister(),
                OtpInputAfterLoginRegister(),
                OtpInputAfterLoginRegister(),
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
            OtpVerificationAfterLoginRegisterButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context,
                    StatusSuccessChangePasswordAfterLoginRegisterScreen
                        .routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
