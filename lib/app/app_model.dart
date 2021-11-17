import 'package:flutter/material.dart';

class AppModel with ChangeNotifier {
  var _darkMode = false;
  bool get darkMode => _darkMode;

  void changeAppTheme() async {
    _darkMode = !_darkMode;
    notifyListeners();
  }
}
