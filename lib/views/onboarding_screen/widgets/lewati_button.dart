import 'package:flutter/material.dart';

import '../../../utils/constant.dart';
import '../../login_screen/views/login_screen.dart';

class LewatiButton extends StatelessWidget {
  const LewatiButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: 50.0,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        },
        style: const ButtonStyle(
            side:
                MaterialStatePropertyAll(BorderSide(color: Color(0xff396EB0))),
            elevation: MaterialStatePropertyAll(0),
            backgroundColor:
                MaterialStatePropertyAll<Color>(Color(0xFFF7F5FF))),
        child: const Text(
          'LEWATI',
          style: TextStyle(
              fontSize: Constant.fontSemiBig, color: Color(0xff396EB0)),
        ),
      ),
    );
  }
}
