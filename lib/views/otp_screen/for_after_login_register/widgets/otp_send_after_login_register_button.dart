import 'package:flutter/material.dart';

class OtpVerificationAfterLoginRegisterButton extends StatelessWidget {
  const OtpVerificationAfterLoginRegisterButton(
      {super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(12.0),
            backgroundColor: const Color(0xFF396EB0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: onPressed,
        child: const Text(
          'Verifikasi',
        ));
  }
}
