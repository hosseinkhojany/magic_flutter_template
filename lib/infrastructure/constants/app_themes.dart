import 'package:flutter/material.dart';
import '../../structure/data/datasources/local/shared_store.dart';

class AppThemes {

  static ThemeData appTheme = SharedStore.getTheme() == "dark" ? dark : light;

  static ThemeData dark = ThemeData.dark();

  static ThemeData light = ThemeData.light();

}
