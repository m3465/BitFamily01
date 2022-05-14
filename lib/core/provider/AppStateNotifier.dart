import 'package:flutter/material.dart';

class AppStateNotifier extends ChangeNotifier {
  //
  bool isDarkMode = true;
  bool changeLangPr = true;
  bool scroll =false;

  void updateThemeCatch(bool up) {
    this.isDarkMode = up;
    notifyListeners();
  }
  Future<void> updatesCRol(bool scr)async {
    this.scroll = scr;
   await Future.delayed(Duration(milliseconds: 10));
   notify();
  }
  void notify()
      {
  notifyListeners();
}
}