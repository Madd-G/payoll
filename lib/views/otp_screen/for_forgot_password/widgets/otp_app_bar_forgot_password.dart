import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payoll/utils/constant.dart';

PreferredSizeWidget otpAppBarForgotPassword(BuildContext context) {
  return AppBar(
    centerTitle: false,
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(FontAwesomeIcons.chevronLeft, color: Colors.black),
    ),
    title: Row(
      children: const [
        Text(
          'Verifikasi Kode OTP',
          style: TextStyle(
              color: Colors.black,
              fontSize: Constant.fontBig,
              fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
