import 'package:flutter/material.dart';
import 'package:payoll/utils/constant.dart';

PreferredSizeWidget appBarProfile(BuildContext context) {
  return AppBar(
    centerTitle: false,
    backgroundColor: const Color(Constant.mainColor),
    title: const Text(
      'Profile',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: Constant.fontBig),
    ),
  );
}
