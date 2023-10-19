import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../../../utils/constant.dart';

class ChangeDateFilterScreen extends StatefulWidget {
  const ChangeDateFilterScreen({super.key});

  @override
  State<ChangeDateFilterScreen> createState() => _ChangeDateFilterScreenState();
}

class _ChangeDateFilterScreenState extends State<ChangeDateFilterScreen> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: size.height * 0.850,
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
              'Filter',
              style: TextStyle(
                  fontSize: Constant.fontSemiBig, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: size.height * 0.020,
            ),
            const Text('Pilih Tanggal yang mau ditampilkan',
                style: TextStyle(
                  color: Color(Constant.textFilterPilihTanggal),
                  fontSize: Constant.fontSemiRegular,
                )),
            SizedBox(
              height: size.height * 0.022,
            ),
            Container(
              height: size.height * 0.120,
              width: size.width * 0.120,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(Constant.lineOr)),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    (today.toString().split('')[0]),
                    style: const TextStyle(
                        fontSize: Constant.fontSemiBig,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: size.height * 0.012,
                  ),
                  const Text('Pilih Tanggal',
                      style: TextStyle(
                          fontSize: Constant.fontSemiRegular,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.030,
            ),
            Expanded(
              child: TableCalendar(
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) => isSameDay(today, day),
                  onDaySelected: _onDaySelected,
                  focusedDay: today,
                  firstDay: DateTime.utc(2000, 01, 01),
                  lastDay: DateTime.utc(2023, 01, 01)),
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
