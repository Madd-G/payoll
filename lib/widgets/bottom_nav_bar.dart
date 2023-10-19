import 'package:flutter/material.dart';
import 'package:payoll/providers/bottom_nav_bar_provider.dart';
import 'package:payoll/utils/constant.dart';
import 'package:payoll/views/home_screen/views/home_screen.dart';
import 'package:payoll/views/profile_screen/views/profile_screen.dart';
import 'package:payoll/views/transaction_history_screen/views/transaction_history_screen.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key, this.pageIndex = 0}) : super(key: key);

  final int pageIndex;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List screens = [
    const HomeScreen(),
    const TransactionHistoryScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    context.read<BottomNavBarProvider>().selectedPageIndex = widget.pageIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarProvider>(builder: (context, provider, _) {
      return Scaffold(
        body: screens[provider.selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w900),
          elevation: 20.0,
          backgroundColor: const Color(0xFFFDFDFD),
          selectedItemColor: const Color(Constant.mainColor),
          unselectedItemColor: Colors.black,
          currentIndex: provider.selectedPageIndex,
          onTap: (value) => provider.selectPage(value),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: 'Riwayat'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          ],
        ),
      );
    });
  }
}
