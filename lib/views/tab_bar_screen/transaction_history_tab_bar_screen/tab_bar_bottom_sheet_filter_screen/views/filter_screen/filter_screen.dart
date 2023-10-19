import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:flutter/material.dart';
import 'package:payoll/views/tab_bar_screen/transaction_history_tab_bar_screen/tab_bar_bottom_sheet_filter_screen/views/filter_date_selection_screen/filter_date_selection_screen.dart';
import 'package:payoll/views/tab_bar_screen/transaction_history_tab_bar_screen/tab_bar_bottom_sheet_filter_screen/widgets/radio_button_filter_widget.dart';
import '../../../../../../utils/constant.dart';
import '../../widgets/product_category_slider_widget.dart';

class BottomSheetFilterScreen extends StatefulWidget {
  const BottomSheetFilterScreen({super.key});

  @override
  State<BottomSheetFilterScreen> createState() =>
      _BottomSheetFilterScreenState();
}

class _BottomSheetFilterScreenState extends State<BottomSheetFilterScreen> {
  List<String> categories = ['Semua', 'Daily', 'Bills', 'Entertainment'];

  @override
  void initState() {
    const ChangeDateFilterScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: size.height * 0.720,
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
              child: ExpandTapWidget(
                tapPadding: const EdgeInsets.all(25.0),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        context: context,
                        builder: (context) => const ChangeDateFilterScreen());
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Tanggal',
                      style: TextStyle(
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
            ),
            SizedBox(
              height: size.height * 0.020,
            ),
            const Text('Kategori',
                style: TextStyle(
                  color: Color(Constant.textFilterPilihTanggal),
                  fontSize: Constant.fontSemiRegular,
                )),
            SizedBox(
              height: size.height * 0.020,
            ),
            ProductCategorySliderBottomSheetFilterWidget(
                size: size, categories: categories),
            SizedBox(
              height: size.height * 0.020,
            ),
            const Text('Status',
                style: TextStyle(
                  color: Color(Constant.textFilterPilihTanggal),
                  fontSize: Constant.fontSemiRegular,
                )),
            SizedBox(
              height: size.height * 0.020,
            ),
            const RadioButtonFilterWidget(),
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
