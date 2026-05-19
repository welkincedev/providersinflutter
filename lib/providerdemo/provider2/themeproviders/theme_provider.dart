import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  String _accentColor = "Blue";

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  String get accentColor => _accentColor;

  MaterialColor get selectedSwatch {
    switch (_accentColor) {
      case "Red":
        return Colors.red;
      case "Green":
        return Colors.green;
      case "Purple":
        return Colors.purple;
      default:
        return Colors.blue;
    }
  }

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    notifyListeners();
  }

  void setAccentColor(String color) {
    _accentColor = color;
    notifyListeners();
  }
}
