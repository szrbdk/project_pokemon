import 'package:flutter/material.dart';
import 'package:project_pokemon/utilities/constants/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider {
  ThemeProvider._();
  static ThemeProvider _instance = ThemeProvider._();
  static ThemeProvider get i => _instance;

  ThemeMode themeMode = ThemeMode.system;
  ThemeData get darkTheme => _darkTheme;
  ThemeData get lightTheme => _lightTheme;

  ThemeData _darkTheme = ThemeData.dark();
  ThemeData _lightTheme = ThemeData.light();

  Future<void> getThemeSettigsFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final _themeString = prefs.getString(StorageKey.theme);
    if (_themeString != null) {
      themeMode = ThemeMode.values.firstWhere(
          (element) => element.toString() == _themeString,
          orElse: () => themeMode);
    }
  }


  Future<bool> saveThemeSettingsFromStorage(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    themeMode = mode;
    final success = await prefs.setString(StorageKey.theme, mode.toString());
    return Future.value(success);
  }
}
