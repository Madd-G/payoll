import 'package:flutter/material.dart';

class PointerBar extends StatelessWidget {
  const PointerBar({
    Key? key,
    required this.size,
    required this.active,
  }) : super(key: key);

  final Size size;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.007,
      width: size.width * 0.08,
      decoration: BoxDecoration(
          color: (active) ? const Color(0xff396EB0) : const Color(0xffDAE4F1),
          borderRadius: const BorderRadius.all(Radius.circular(10.0))),
    );
  }
}
