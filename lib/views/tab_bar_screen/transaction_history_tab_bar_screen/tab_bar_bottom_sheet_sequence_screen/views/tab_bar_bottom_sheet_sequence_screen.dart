import 'package:flutter/material.dart';
import 'package:getwidget/components/radio/gf_radio.dart';
import 'package:payoll/utils/constant.dart';

class BottomSheetSequenceScreen extends StatefulWidget {
  const BottomSheetSequenceScreen({super.key});

  @override
  State<BottomSheetSequenceScreen> createState() =>
      _BottomSheetSequenceScreenState();
}

enum SequenceRadio { latest, longest }

class _BottomSheetSequenceScreenState extends State<BottomSheetSequenceScreen> {
  SequenceRadio? _radio = SequenceRadio.latest;

  @override
  void initState() {
    _radio;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: size.height * 0.280,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(Constant.lineBottomSheet),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  height: size.height * 0.004,
                  width: size.width * 0.180,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.030,
            ),
            const Text(
              'Urutan',
              style: TextStyle(
                  fontSize: Constant.fontSemiBig, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: size.height * 0.030,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      GFRadio(
                        size: 28.0,
                        activeBorderColor: const Color(Constant.mainColor),
                        radioColor: const Color(Constant.mainColor),
                        value: SequenceRadio.latest,
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
                      const Text('Terbaru',
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
                        value: SequenceRadio.longest,
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
                        'Terlama',
                        style: TextStyle(fontSize: Constant.fontSemiBig),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.040,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(12.0),
                        backgroundColor:
                            const Color(Constant.buttonResetBottomSheet),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                                color: Color(Constant.mainColor)))),
                    onPressed: () {},
                    child: const Text(
                      'Reset',
                      style: TextStyle(color: Color(Constant.mainColor)),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(12.0),
                        backgroundColor: const Color(Constant.mainColor),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () {},
                    child: const Text('Terapkan')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
