import 'package:flutter/material.dart';

class ListMenu extends StatelessWidget {
  const ListMenu(
      {super.key,
      required this.onTapMenu1,
      required this.onTapMenu2,
      required this.onTapMenu3});

  final VoidCallback onTapMenu1;
  final VoidCallback onTapMenu2;
  final VoidCallback onTapMenu3;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 7.0,
            spreadRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
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
                  child: Image.asset('assets/icons/user-edit.png')),
              title: const Text('Pengaturan Akun'),
              trailing: const Icon(Icons.keyboard_arrow_right_sharp),
              onTap: onTapMenu1,
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            ListTile(
              leading: SizedBox(
                  height: size.height * 0.025,
                  width: size.width * 0.100,
                  child: Image.asset('assets/icons/lock.png')),
              title: const Text('Ubah Kata sandi'),
              trailing: const Icon(Icons.keyboard_arrow_right_sharp),
              onTap: onTapMenu2,
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            ListTile(
              leading: SizedBox(
                  height: size.height * 0.025,
                  width: size.width * 0.100,
                  child: Image.asset('assets/icons/star.png')),
              title: const Text('Reward Poin'),
              trailing: const Icon(Icons.keyboard_arrow_right_sharp),
              onTap: onTapMenu3,
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
