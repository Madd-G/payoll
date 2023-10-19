import 'package:flutter/material.dart';
import 'package:payoll/views/change_password_screen/for_after_login_register/widgets/app_bar_after_login_register.dart';
import 'package:provider/provider.dart';
import '../../../../providers/change_password_provider.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/state/finite_state.dart';
import '../../../../widgets/bottom_nav_bar.dart';

class ChangePasswordAfterLoginRegisterScreen extends StatefulWidget {
  static const String routeName = 'change-password-after-login-after-screen';

  const ChangePasswordAfterLoginRegisterScreen({super.key});

  @override
  State<ChangePasswordAfterLoginRegisterScreen> createState() =>
      _ChangePasswordAfterLoginRegisterScreenState();
}

class _ChangePasswordAfterLoginRegisterScreenState
    extends State<ChangePasswordAfterLoginRegisterScreen> {
  final GlobalKey<FormState> _updatePasswordFormKey = GlobalKey<FormState>();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController newPasswordConfirmController =
      TextEditingController();
  bool _showHideOldPass = true;
  bool _showHideNewPass = true;
  bool _showHideNewPassConfirm = true;

  @override
  void initState() {
    final provider =
        Provider.of<ChangePasswordProvider>(context, listen: false);
    provider.addListener(
      () {
        if (provider.myState == MyState.failed) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 1),
              content: Text(
                'Tidak dapat memperbarui kata sandi',
              ),
            ),
          );
        } else if (provider.myState == MyState.loaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 1),
              content: Text(
                'Kata sandi berhasil diperbarui',
              ),
            ),
          );
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const BottomNavBar(
                        pageIndex: 2,
                      )),
              (route) => false);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final provider =
        Provider.of<ChangePasswordProvider>(context, listen: false);

    return Scaffold(
      appBar: appBarAfterLoginRegister(context),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Form(
                  key: _updatePasswordFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Kata sandi Lama',
                        style: TextStyle(
                            fontSize: Constant.fontSemiRegular,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: size.height * 0.018,
                      ),
                      TextFormField(
                        controller: oldPasswordController,
                        obscureText: _showHideOldPass,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: _showHideOldPass
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              onPressed: () => {
                                setState(
                                  () {
                                    _showHideOldPass = !_showHideOldPass;
                                  },
                                )
                              },
                            ),
                            filled: true,
                            fillColor: const Color(
                                Constant.greyTextFieldLoginRegister),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(
                                        Constant.greyOutlineBorderTextField))),
                            hintText: '1234********',
                            hintStyle: const TextStyle(),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(
                                        Constant.greyOutlineBorderTextField))),
                            contentPadding: const EdgeInsets.all(12.0),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                        // validator: (String? value) {
                        //   if (value!.isEmpty) {
                        //     return '';
                        //   } else {
                        //     return null;
                        //   }
                        // }
                      ),
                      SizedBox(
                        height: size.height * 0.018,
                      ),
                      const Text(
                        'Kata sandi Baru',
                        style: TextStyle(
                            fontSize: Constant.fontSemiRegular,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: size.height * 0.018,
                      ),
                      TextFormField(
                        controller: newPasswordController,
                        obscureText: _showHideNewPass,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: _showHideNewPass
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              onPressed: () => {
                                setState(
                                  () {
                                    _showHideNewPass = !_showHideNewPass;
                                  },
                                )
                              },
                            ),
                            filled: true,
                            fillColor: const Color(
                                Constant.greyTextFieldLoginRegister),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(
                                        Constant.greyOutlineBorderTextField))),
                            hintText: '1234********',
                            hintStyle: const TextStyle(),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(
                                        Constant.greyOutlineBorderTextField))),
                            contentPadding: const EdgeInsets.all(12.0),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                     
                      ),
                      SizedBox(
                        height: size.height * 0.018,
                      ),
                      const Text(
                        'Konfirmasi Kata sandi Baru',
                        style: TextStyle(
                            fontSize: Constant.fontSemiRegular,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: size.height * 0.018,
                      ),
                      TextFormField(
                        controller: newPasswordConfirmController,
                        obscureText: _showHideNewPassConfirm,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: _showHideNewPassConfirm
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              onPressed: () => {
                                setState(
                                  () {
                                    _showHideNewPassConfirm =
                                        !_showHideNewPassConfirm;
                                  },
                                )
                              },
                            ),
                            filled: true,
                            fillColor: const Color(
                                Constant.greyTextFieldLoginRegister),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(
                                        Constant.greyOutlineBorderTextField))),
                            hintText: '1234********',
                            hintStyle: const TextStyle(),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(
                                        Constant.greyOutlineBorderTextField))),
                            contentPadding: const EdgeInsets.all(12.0),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                      ),
                      SizedBox(
                        height: size.height * 0.018,
                      ),
                    ],
                  )),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(12.0),
                  backgroundColor: const Color(0xFF396EB0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              onPressed: () async {
                if (newPasswordController.text !=
                    newPasswordConfirmController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text(
                        'Kata Sandi Baru dan Konfirmasi Kata Sandi tidak cocok',
                      ),
                    ),
                  );
                } else if (_updatePasswordFormKey.currentState!.validate()) {
                  _updatePasswordFormKey.currentState!.save();
                  await provider.changePassword(
                      oldPassword: oldPasswordController.text,
                      newPassword: newPasswordController.text);
                }
              },
              child: const Text(
                'UBAH',
                style: TextStyle(
                    fontSize: Constant.fontSemiRegular,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
