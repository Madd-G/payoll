import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payoll/utils/constant.dart';

PreferredSizeWidget otpAppBarAfterLoginRegister(BuildContext context) {
  return AppBar(
    centerTitle: false,
    backgroundColor: const Color(Constant.mainColor),
    elevation: 0,
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(FontAwesomeIcons.chevronLeft, color: Colors.white),
    ),
    title: Row(
      children: const [
        Text(
          'Verifikasi Kode OTP',
          style: TextStyle(
              color: Colors.white,
              fontSize: Constant.fontBig,
              fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
