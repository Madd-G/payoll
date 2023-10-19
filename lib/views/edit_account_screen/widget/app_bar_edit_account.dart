import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payoll/utils/constant.dart';

PreferredSizeWidget appBarEditAccount(BuildContext context) {
  return AppBar(
    centerTitle: false,
    elevation: 0,
    backgroundColor: const Color(Constant.mainColor),
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(FontAwesomeIcons.chevronLeft, color: Colors.white),
    ),
    title: const Text(
      'Pengaturan Akun',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: Constant.fontBig),
    ),
  );
}
