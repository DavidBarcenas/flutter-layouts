import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkMode = false, _customTheme = false;

  bool get darMode => this._darkMode;
  bool get customTheme => this._customTheme;

  set darkMode(bool value) {
    this._customTheme = false;
    this._darkMode = value;
    notifyListeners();
  }

  set customTheme(bool value) {
    this._darkMode = false;
    this._customTheme = value;
    notifyListeners();
  }
}
