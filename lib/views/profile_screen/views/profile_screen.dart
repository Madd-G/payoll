import 'package:flutter/material.dart';
import 'package:payoll/utils/constant.dart';
import 'package:payoll/views/change_password_screen/for_after_login_register/views/change_password_after_login_register_screen.dart';
import 'package:payoll/views/edit_account_screen/views/edit_account_screen.dart';
import 'package:payoll/views/login_screen/views/login_screen.dart';
import 'package:payoll/views/profile_screen/widgets/account_profile.dart';
import 'package:payoll/views/profile_screen/widgets/app_bar_profile.dart';
import 'package:payoll/views/profile_screen/widgets/list_info.dart';
import 'package:payoll/views/profile_screen/widgets/list_menu.dart';
import 'package:payoll/views/profile_screen/widgets/profile_logout_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../providers/sign_in_provider.dart';
import '../../../providers/user_provider.dart';
import '../../../services/sharedServices.dart';
import '../../../utils/state/finite_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late SharedPreferences loginData;
  String username = '';

  void initial() async {
    loginData = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    initial();
    Future.delayed(
      Duration.zero,
      () {
        final profileProvider =
            Provider.of<UserProvider>(context, listen: false);
        profileProvider.fetchProfile();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignInProvider>(context, listen: false);
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: appBarProfile(context),
        body: ListView(padding: const EdgeInsets.all(24.0), children: [
          const AccountProfile(),
          SizedBox(
            height: size.height * 0.025,
          ),
          const Text(
            'Menu',
            style: TextStyle(
                fontSize: Constant.fontBig, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          ListMenu(
            onTapMenu1: () {
              Navigator.pushNamed(context, EditAccountScreen.routeName);
            },
            onTapMenu2: () {
              Navigator.pushNamed(
                  context, ChangePasswordAfterLoginRegisterScreen.routeName);
            },
            onTapMenu3: () {},
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          const Text(
            'Info',
            style: TextStyle(
                fontSize: Constant.fontBig, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          ListInfo(
            onTapInfo1: () {},
            onTapInfo2: () {},
            onTapInfo3: () {},
          ),
          SizedBox(
            height: size.height * 0.035,
          ),
          ProfileLogoutButton(onPressed: () {
            final prf = SharedService();
            prf.deleteToken();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 1),
                content: Text(
                  'Berhasil Keluar',
                ),
              ),
            );
            Navigator.pushNamedAndRemoveUntil(
                context, LoginScreen.routeName, (route) => false);
            // loginData.setBool('login', true);
            // loginData.remove('username');

            // if (provider.myState == MyState.loaded) {
            //   username = loginData.getString('username').toString();
            //   ScaffoldMessenger.of(context).showSnackBar(
            //     const SnackBar(
            //       duration: Duration(seconds: 1),
            //       content: Text(
            //         'Berhasil Keluar',
            //       ),
            //     ),
            //   );
            //   Navigator.pushNamedAndRemoveUntil(
            //       context, LoginScreen.routeName, (route) => false);
            // }
          })
        ]));
  }
}
