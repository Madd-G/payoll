import 'package:flutter/material.dart';
import 'package:payoll/views/status_success_screen/status_success_forgot_password_screen/views/status_success_forgot_password_screen.dart';
import '../../../../utils/constant.dart';
import '../../../login_screen/views/login_screen.dart';
import '../widgets/change_password_forgot_password_button.dart';

class ChangePasswordForgotPasswordScreen extends StatefulWidget {
  static const String routeName = 'change-password-screen';

  const ChangePasswordForgotPasswordScreen({super.key});

  @override
  State<ChangePasswordForgotPasswordScreen> createState() =>
      _ChangePasswordForgotPasswordScreenState();
}

class _ChangePasswordForgotPasswordScreenState
    extends State<ChangePasswordForgotPasswordScreen> {
  final GlobalKey formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool checkBox = false;
  bool _showHidePass = true;
  bool _showHidePassConfrim = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: size.height * 0.050,
            ),
            const Center(
                child: Text(
              'Ubah Kata Sandi',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),
            )),
            SizedBox(
              height: size.height * 0.018,
            ),
            const Center(
                child: Text(
                    'Silahkan masukan email anda untuk melakukan ubah kata sandi',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: Constant.fontRegular))),
            SizedBox(
              height: size.height * 0.018,
            ),
            Expanded(
              child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Kata Sandi',
                        style: TextStyle(
                            fontSize: Constant.fontRegular,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: size.height * 0.018,
                      ),
                      TextFormField(
                        obscureText: _showHidePass,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: _showHidePass
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              onPressed: () => {
                                setState(
                                  () {
                                    _showHidePass = !_showHidePass;
                                  },
                                )
                              },
                            ),
                            filled: true,
                            fillColor: const Color(
                                Constant.greyTextFieldLoginRegister),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(Constant.greyTextField))),
                            hintText: '1234********',
                            hintStyle: const TextStyle(),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(Constant.greyTextField))),
                            contentPadding: const EdgeInsets.all(12.0),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                      ),
                      SizedBox(
                        height: size.height * 0.018,
                      ),
                      const Text(
                        'Konfirmasi Kata Sandi',
                        style: TextStyle(
                            fontSize: Constant.fontRegular,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: size.height * 0.018,
                      ),
                      TextFormField(
                        obscureText: _showHidePassConfrim,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: _showHidePassConfrim
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              onPressed: () => {
                                setState(
                                  () {
                                    _showHidePassConfrim =
                                        !_showHidePassConfrim;
                                  },
                                )
                              },
                            ),
                            filled: true,
                            fillColor: const Color(
                                Constant.greyTextFieldLoginRegister),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(Constant.greyTextField))),
                            hintText: '1234********',
                            hintStyle: const TextStyle(),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(Constant.greyTextField))),
                            contentPadding: const EdgeInsets.all(12.0),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                      ),
                      SizedBox(
                        height: size.height * 0.018,
                      ),
                      ChangePasswordForgotPasswordButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context,
                              StatusSuccessForgotPasswordScreen.routeName);
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.020,
                      ),
                    ],
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sudah punya akun?',
                  style: TextStyle(),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, LoginScreen.routeName);
                    },
                    child: const Text('Masuk',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF396EB0))))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
