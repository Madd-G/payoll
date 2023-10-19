import 'package:flutter/material.dart';
import 'package:getwidget/components/radio/gf_radio.dart';
import '../../../../../utils/constant.dart';

class RadioButtonFilterWidget extends StatefulWidget {
  const RadioButtonFilterWidget({super.key});

  @override
  State<RadioButtonFilterWidget> createState() =>
      _RadioButtonFilterWidgetState();
}

enum SequenceRadio { succeed, pending, canceled }
class _RadioButtonFilterWidgetState extends State<RadioButtonFilterWidget> {
  SequenceRadio? _radio = SequenceRadio.succeed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            GFRadio(
              size: 28.0,
              activeBorderColor: const Color(Constant.mainColor),
              radioColor: const Color(Constant.mainColor),
              value: SequenceRadio.succeed,
              groupValue: _radio,
              onChanged: (value) {
                setState(() {
                  _radio = value;
                });
              },
            ),
            SizedBox(
              width: size.width * 0.015,
            ),
            const Text('Berhasil',
                style: TextStyle(fontSize: Constant.fontSemiBig)),
          ],
        ),
        SizedBox(
          height: size.height * 0.020,
        ),
        Row(
          children: [
            GFRadio(
              size: 28.0,
              activeBorderColor: const Color(Constant.mainColor),
              radioColor: const Color(Constant.mainColor),
              value: SequenceRadio.pending,
              groupValue: _radio,
              onChanged: (value) {
                setState(() {
                  _radio = value;
                });
              },
            ),
            SizedBox(
              width: size.width * 0.015,
            ),
            const Text(
              'Pending',
              style: TextStyle(fontSize: Constant.fontSemiBig),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.020,
        ),
        Row(
          children: [
            GFRadio(
              size: 28.0,
              activeBorderColor: const Color(Constant.mainColor),
              radioColor: const Color(Constant.mainColor),
              value: SequenceRadio.canceled,
              groupValue: _radio,
              onChanged: (value) {
                setState(() {
                  _radio = value;
                });
              },
            ),
            SizedBox(
              width: size.width * 0.015,
            ),
            const Text(
              'Dibatalkan',
              style: TextStyle(fontSize: Constant.fontSemiBig),
            ),
          ],
        ),
      ],
    );
  }
}
