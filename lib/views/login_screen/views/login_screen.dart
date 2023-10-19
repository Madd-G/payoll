import 'package:flutter/material.dart';
import 'package:payoll/views/forgot_password_screen/views/forgot_password.dart';
import 'package:payoll/views/login_screen/widgets/login_button_google.dart';
import 'package:payoll/views/register_screen/views/register_screen.dart';
import 'package:payoll/views/splash_screen/views/splash_screen.dart';
import 'package:provider/provider.dart';

import '../../../providers/sign_in_provider.dart';
import '../../../services/sharedServices.dart';
import '../../../utils/constant.dart';
import '../../../utils/state/finite_state.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'loginscreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool checkBox = false;
  bool _showHidePass = true;

  @override
  void initState() {
    final provider = Provider.of<SignInProvider>(context, listen: false);
    provider.addListener(
      () {
        if (provider.myState == MyState.failed) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 1),
              content: Text(
                'Pengguna tidak ada!',
              ),
            ),
          );
        } else if (provider.myState == MyState.loaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 1),
              content: Text(
                'Berhasil Masuk',
              ),
            ),
          );
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const SplashScreen(),
              ),
              (route) => false);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final provider = Provider.of<SignInProvider>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: size.height * 0.050,
              ),
              const Center(
                  child: Text(
                'Selamat Datang',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),
              )),
              const Center(
                  child: Text('Silahkan masuk dengan akun anda',
                      style: TextStyle(fontSize: Constant.fontRegular))),
              SizedBox(
                height: size.height * 0.018,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Email',
                        style: TextStyle(
                            fontSize: Constant.fontRegular,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: size.height * 0.018,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor:
                                Color(Constant.greyTextFieldLoginRegister),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(Constant.greyTextField))),
                            hintText: 'mail@mail.com',
                            hintStyle: TextStyle(),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(Constant.greyTextField))),
                            contentPadding: EdgeInsets.all(12.0),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                        validator: (String? value) {
                          const String expression = "[a-zA-Z0-9+._%-+]{1,256}"
                              "\\@"
                              "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}"
                              "("
                              "\\."
                              "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}"
                              ")+";
                          final RegExp regExp = RegExp(expression);
                          return !regExp.hasMatch(value!)
                              ? "Silakan, masukkan email yang valid!"
                              : null;
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.018,
                      ),
                      const Text(
                        'Password',
                        style: TextStyle(
                            fontSize: Constant.fontRegular,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: size.height * 0.018,
                      ),
                      TextFormField(
                          controller: _passwordController,
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
                                  borderSide:
                                      BorderSide(color: Color(0xFFE9EBEF))),
                              contentPadding: const EdgeInsets.all(12.0),
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)))),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Silakan isi kolom kata sandi!';
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(
                        height: size.height * 0.018,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                side:
                                    const BorderSide(color: Color(0xFFC5C5C5)),
                                value: checkBox,
                                onChanged: (bool? value) {
                                  setState(() {
                                    checkBox = value!;
                                  });
                                },
                              ),
                              const Text('Ingat saya',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Row(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context,
                                        ForgotPasswordScreen.routeName);
                                  },
                                  child: const Text(
                                    'Lupa Kata Sandi?',
                                    style: TextStyle(
                                        color: Color(0xFF396EB0),
                                        fontWeight: FontWeight.w500),
                                  ))
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.018,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(12.0),
                              backgroundColor: const Color(0xFF396EB0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: () async {
                            final prf = SharedService();
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
        
                              await provider.signIn(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                              // prf.saveToken(token)
                            }
                          },
                          child: const Text('MASUK')),
                      SizedBox(
                        height: size.height * 0.020,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: size.height * 0.001,
                            width: size.width * 0.350,
                            color: const Color(0xFFA9A9A9),
                          ),
                          const Text(
                            'atau',
                            style: TextStyle(
                                fontSize: Constant.fontRegular,
                                fontWeight: FontWeight.w400),
                          ),
                          Container(
                            height: size.height * 0.001,
                            width: size.width * 0.350,
                            color: const Color(0xFFA9A9A9),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.030,
                      ),
                      LoginGoogle(
                        onPressed: () {},
                      )
                    ],
                  )),
                  SizedBox(
                    height: size.height * 0.150,
                  ),
              Column(
                children: [
                  const Text(
                    'Belum punya akun?',
                    style: TextStyle(),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RegisterScreen.routeName);
                      },
                      child: const Text('Daftar',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(Constant.mainColor))))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
