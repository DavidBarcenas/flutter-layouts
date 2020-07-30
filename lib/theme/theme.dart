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
        this._currenTheme =
            ThemeData.dark().copyWith(accentColor: Colors.pinkAccent);
        break;

      case 3:
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
      this._currenTheme =
          ThemeData.dark().copyWith(accentColor: Colors.pinkAccent);
    } else {
      this._currenTheme = ThemeData.light().copyWith(
          accentColor: Colors.red,
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Color(0xff16202B));
    }
    notifyListeners();
  }

  set customTheme(bool value) {
    this._darkMode = false;
    this._customTheme = value;

    this._currenTheme = ThemeData.light().copyWith(
        accentColor: Color(0xff48a0eb),
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Color(0xff16202B));
    notifyListeners();
  }
}
