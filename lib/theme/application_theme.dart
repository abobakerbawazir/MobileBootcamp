
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Application_theme with ChangeNotifier {
  ThemeMode mode = ThemeMode.light;
  toggleTheme(bool isdark) {
    mode = isdark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
