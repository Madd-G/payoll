import 'package:flutter/material.dart';

import '../../../utils/constant.dart';

class LanjutkanButton extends StatelessWidget {
  const LanjutkanButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 50.0,
      child: ElevatedButton(
        onPressed: onPressed,
        style: const ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll<Color>(Color(0xff396EB0))),
        child: const Text(
          'LANJUTKAN',
          style: TextStyle(fontSize: Constant.fontSemiBig),
        ),
      ),
    );
  }
}
