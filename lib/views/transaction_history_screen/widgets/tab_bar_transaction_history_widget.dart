// import 'package:expand_tap_area/expand_tap_area.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:payoll/utils/constant.dart';
// import 'package:payoll/views/tab_bar_screen/transaction_history_tab_bar_screen/tab_bar_bottom_sheet_sequence_screen/views/tab_bar_bottom_sheet_sequence_screen.dart';
// import '../../tab_bar_screen/transaction_history_tab_bar_screen/tab_bar_bottom_sheet_filter_screen/views/filter_screen/filter_screen.dart';
//
// PreferredSizeWidget tabBarTransactionHistory(BuildContext context) {
//   final size = MediaQuery.of(context).size;
//   return TabBar(indicatorColor: Colors.transparent, tabs: [
//     ExpandTapWidget(
//       tapPadding: const EdgeInsets.all(25.0),
//       onTap: () {
//         showModalBottomSheet(
//           isScrollControlled: true,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           context: context,
//           builder: (context) => const BottomSheetSequenceScreen(),
//         );
//       },
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Tab(
//               icon: Icon(
//             FontAwesomeIcons.arrowDownWideShort,
//             size: 20,
//             color: Color(Constant.mainColor),
//           )),
//           SizedBox(
//             width: size.width * 0.020,
//           ),
//           const Text(
//             'Urutan',
//             style: TextStyle(
//               fontSize: Constant.fontSemiRegular,
//               color: Color(Constant.mainColor),
//             ),
//           ),
//         ],
//       ),
//     ),
//     ExpandTapWidget(
//       tapPadding: const EdgeInsets.all(25.0),
//       onTap: () {
//         showModalBottomSheet(
//           isScrollControlled: true,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           context: context,
//           builder: (context) => const BottomSheetFilterScreen(),
//         );
//       },
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Tab(
//               icon: Icon(
//             FontAwesomeIcons.filter,
//             size: 20,
//             color: Color(Constant.mainColor),
//           )),
//           SizedBox(
//             width: size.width * 0.020,
//           ),
//           const Text(
//             'Filter',
//             style: TextStyle(
//               fontSize: Constant.fontSemiRegular,
//               color: Color(Constant.mainColor),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ]);
// }
