import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkMode = false, _customTheme = false;
  ThemeData _currenTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        this._darkMode = false;
        this._customTheme = false;
        this._currenTheme = ThemeData.light();
        break;

      case 2:
        this._darkMode = true;
        this._customTheme = false;
        this._currenTheme = ThemeData.dark();
        break;

      case 2:
        this._darkMode = false;
        this._customTheme = true;
        break;

      default:
        this._darkMode = false;
        this._customTheme = false;
        this._currenTheme = ThemeData.light();
    }
  }

  bool get darMode => this._darkMode;
  bool get customTheme => this._customTheme;
  ThemeData get currenTheme => this._currenTheme;

  set darkMode(bool value) {
    this._customTheme = false;
    this._darkMode = value;
    if (value) {
      this._currenTheme = ThemeData.dark();
    } else {
      this._currenTheme = ThemeData.light();
    }
    notifyListeners();
  }

  set customTheme(bool value) {
    this._darkMode = false;
    this._customTheme = value;
    notifyListeners();
  }
}
