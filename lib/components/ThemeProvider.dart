import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  // Initialize with light theme
  int _isDarkMode = 0;

  int get isDarkMode => _isDarkMode;

  ThemeMode get themeMode =>
      _isDarkMode == 0
          ? ThemeMode.system
          : _isDarkMode == 1
          ? ThemeMode.light
          : ThemeMode.dark;

  void toggleTheme() {
    _isDarkMode = (_isDarkMode + 1) % 3; // Cycle through 0, 1, 2
    notifyListeners();
  }
}
