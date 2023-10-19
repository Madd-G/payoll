import 'package:flutter/material.dart';
import 'package:payoll/providers/user_provider.dart';
import 'package:payoll/views/edit_account_screen/widget/app_bar_edit_account.dart';
import 'package:payoll/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import '../../../providers/update_profile_provider.dart';
import '../../../utils/constant.dart';
import '../../../utils/state/finite_state.dart';

class EditAccountScreen extends StatefulWidget {
  static const String routeName = 'edit-account-screen';

  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  final GlobalKey<FormState> _updateFormKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool checkBox = false;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<UpdateProfileProvider>(context, listen: false);
    provider.addListener(
      () {
        if (provider.myState == MyState.failed) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 1),
              content: Text(
                'Tidak dapat memperbarui profil',
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
    final provider = Provider.of<UpdateProfileProvider>(context, listen: false);
    return Scaffold(
      appBar: appBarEditAccount(context),
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: const Color(Constant.mainColor),
            height: size.height * 0.220,
            width: size.width * 0.200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profil.jpg'),
                  radius: 50.0,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Ubah Foto',
                      style: TextStyle(
                          fontSize: Constant.fontSemiBig, color: Colors.white),
                    )),
                     SizedBox(
            height: size.height * 0.012,
          ),
              ],
            ),
          ),
         
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Consumer2<UpdateProfileProvider, UserProvider>(
                      builder: (context, provider, provider2, _) {
                    final user = provider2.profileModel;
                    return Form(
                      key: _updateFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Nama Lengkap',
                            style: TextStyle(
                                fontSize: Constant.fontSemiRegular,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: size.height * 0.018,
                          ),
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(
                                  Constant.greyTextFieldLoginRegister),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(Constant
                                          .greyOutlineBorderTextField))),
                              hintText: '${user?.name}',
                              hintStyle: const TextStyle(),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(Constant
                                          .greyOutlineBorderTextField))),
                              contentPadding: const EdgeInsets.all(12.0),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.018,
                          ),
                          const Text(
                            'Email',
                            style: TextStyle(
                                fontSize: Constant.fontSemiRegular,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: size.height * 0.018,
                          ),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(
                                    Constant.greyTextFieldLoginRegister),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(Constant
                                            .greyOutlineBorderTextField))),
                                hintText: '${user?.email}',
                                hintStyle: const TextStyle(),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(Constant
                                            .greyOutlineBorderTextField))),
                                contentPadding: const EdgeInsets.all(12.0),
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)))),
                            validator: (String? value) {
                              const String expression =
                                  "[a-zA-Z0-9+._%-+]{1,256}"
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
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(12.0),
                    backgroundColor: const Color(0xFF396EB0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                onPressed: () async {
                  if (_updateFormKey.currentState!.validate()) {
                    _updateFormKey.currentState!.save();
                    await provider.updateProfile(
                      name: nameController.text,
                      email: emailController.text,
                    );
                  }
                },
                child: const Text(
                  'SIMPAN',
                )),
          )
        ],
      ),
    );
  }
}
