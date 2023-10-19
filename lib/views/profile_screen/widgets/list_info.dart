import 'package:flutter/material.dart';

class ListInfo extends StatelessWidget {
  const ListInfo(
      {super.key,
      required this.onTapInfo1,
      required this.onTapInfo2,
      required this.onTapInfo3});

  final VoidCallback onTapInfo1;
  final VoidCallback onTapInfo2;
  final VoidCallback onTapInfo3;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 7.0,
            spreadRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      width: size.width * 0.365,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.025,
            ),
            ListTile(
              leading: SizedBox(
                  height: size.height * 0.025,
                  width: size.width * 0.100,
                  child: Image.asset('assets/icons/question.png')),
              title: const Text('Bantuan'),
              trailing: const Icon(Icons.keyboard_arrow_right_sharp),
              onTap: onTapInfo1,
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            ListTile(
              leading: SizedBox(
                  height: size.height * 0.025,
                  width: size.width * 0.100,
                  child: Image.asset('assets/icons/scroll.png')),
              title: const Text('Syarat & Ketentuan'),
              trailing: const Icon(Icons.keyboard_arrow_right_sharp),
              onTap: onTapInfo2,
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            ListTile(
              leading: SizedBox(
                  height: size.height * 0.025,
                  width: size.width * 0.100,
                  child: Image.asset('assets/icons/shield-check.png')),
              title: const Text('Kebijakan Privasi'),
              trailing: const Icon(Icons.keyboard_arrow_right_sharp),
              onTap: onTapInfo3,
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
          ],
        ),
      ),
    );
  }
}
