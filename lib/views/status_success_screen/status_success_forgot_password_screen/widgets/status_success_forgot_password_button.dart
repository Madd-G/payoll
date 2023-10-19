import 'package:flutter/material.dart';
import 'package:payoll/utils/constant.dart';

class StatusSuccessForgotPasswordButton extends StatelessWidget {
  const StatusSuccessForgotPasswordButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(12.0),
            backgroundColor: const Color(Constant.mainColor),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: onPressed,
        child: const Text(
          'KEMBALI KE MASUK',
          style: TextStyle(fontWeight: FontWeight.w500),
        ));
  }
}
