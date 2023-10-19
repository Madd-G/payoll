import 'package:flutter/material.dart';

class FeatureIconWidget extends StatelessWidget {
  const FeatureIconWidget({
    Key? key,
    required this.size,
    required this.text,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final Size size;
  final String text;
  final String icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 60.0,
            width: 60.0,
            decoration: const BoxDecoration(
                color: Color(0xffFAFAFA),
                borderRadius: BorderRadius.all(Radius.circular(50.0))),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.asset(icon),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        SizedBox(
            height: 50.0,
            width: 80.0,
            child: Text(
              text,
              textAlign: TextAlign.center,
            ))
      ],
    );
  }
}
