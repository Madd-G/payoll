import 'package:flutter/material.dart';

class BottomNavBarProvider extends ChangeNotifier {
  int selectedPageIndex = 0;

  void selectPage(int currentPage) {
    selectedPageIndex = currentPage;
    notifyListeners();
  }
}
