import 'package:flutter/material.dart';

class ThemeRepository{
  bool isDark = true;

  static final ThemeData light = ThemeData();
  static final ThemeData dark = ThemeData.dark();

  ThemeData get theme => isDark ? dark : light;

  swithTheme(){
    isDark = !isDark;
  }
}