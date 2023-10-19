import 'package:flutter/material.dart';
import 'package:payoll/utils/constant.dart';
import 'package:provider/provider.dart';
import '../../../providers/sign_up_provider.dart';
import '../../../utils/state/finite_state.dart';
import '../../login_screen/views/login_screen.dart';
import '../../status_success_screen/status_success_register_screen/views/status_success_register_screen.dart';
import '../widgets/register_button_google.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register_screen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool checkBox = false;
  bool _showHidePass = true;
  bool _showHidePassConfirm = true;

  @override
  void initState() {
    final provider = Provider.of<SignUpProvider>(context, listen: false);
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
               'Berhasil Daftar',
              ),
            ),
          );
          Navigator.pushReplacementNamed(
              context, StatusSuccessRegisterScreen.routeName);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final provider = Provider.of<SignUpProvider>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.045,
              ),
              const Center(
                  child: Text(
                'Daftar',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),
              )),
              const Center(
                  child: Text('Silahkan mendaftarkan akun anda disini',
                      style: TextStyle(fontSize: Constant.fontRegular))),
              SizedBox(
                height: size.height * 0.025,
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Nama Lengkap',
                      style: TextStyle(
                          fontSize: Constant.fontRegular,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: size.height * 0.018,
                    ),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(Constant.greyTextFieldLoginRegister),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(Constant.greyTextField))),
                          hintText: 'George lee',
                          hintStyle: TextStyle(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(Constant.greyTextField))),
                          contentPadding: EdgeInsets.all(12.0),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Silakan, isi bidang nama pengguna!';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.018,
                    ),
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
                          fillColor: Color(Constant.greyTextFieldLoginRegister),
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
                      'Kata Sandi',
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
                          fillColor:
                              const Color(Constant.greyTextFieldLoginRegister),
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
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Silakan isi kolom kata sandi!';
                        } else {
                          return null;
                        }
                      },
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
                      controller: _confirmPasswordController,
                      obscureText: _showHidePassConfirm,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: _showHidePassConfirm
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                            onPressed: () => {
                              setState(
                                () {
                                  _showHidePassConfirm = !_showHidePassConfirm;
                                },
                              )
                            },
                          ),
                          filled: true,
                          fillColor:
                              const Color(Constant.greyTextFieldLoginRegister),
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
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Silakan isi kolom kata sandi!';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.030,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(12.0),
                            backgroundColor: const Color(0xFF396EB0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: () async {
                          if (_passwordController.text !=
                              _confirmPasswordController.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text(
                                  'Kata Sandi dan Konfirmasi Kata Sandi tidak cocok',
                                ),
                              ),
                            );
                          } else if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            await provider.signUp(
                              email: _emailController.text,
                              password: _passwordController.text,
                              name: _nameController.text,
                            );
                          }
                        },
                        child: const Text('DAFTAR')),
                    SizedBox(
                      height: size.height * 0.020,
                    ),
                    const Center(
                        child: Text(
                      'Dengan mendaftar, saya telah menyetujui',
                      style: TextStyle(fontSize: Constant.fontSmall),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: const Text('Ketentuan Layanan',
                                    style: TextStyle(
                                        fontSize: Constant.fontSmall,
                                        color: Color(0xFF0000A3))))
                          ],
                        ),
                        const Text('dan',
                            style: TextStyle(fontSize: Constant.fontSmall)),
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: const Text('Kebijakan Kami',
                                    style: TextStyle(
                                        fontSize: Constant.fontSmall,
                                        color: Color(0xFF0000A3))))
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.002,
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
                      height: size.height * 0.020,
                    ),
                    RegisterGoogle(
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
               SizedBox(
                    height: size.height * 0.018,
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sudah punya akun?',
                    style: TextStyle(fontSize: Constant.fontRegular),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, LoginScreen.routeName);
                    },
                    child: const Text(
                     'Berhasil Daftar',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(Constant.mainColor),
                        fontSize: Constant.fontRegular,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
