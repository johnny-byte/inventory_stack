import 'package:flutter/cupertino.dart';

class ThemeRepository{
  bool isDark = true;

  static const  CupertinoThemeData light = CupertinoThemeData(brightness: Brightness.light, primaryColor: CupertinoColors.systemOrange,);
  static const  CupertinoThemeData dark = CupertinoThemeData(brightness: Brightness.dark, primaryColor: CupertinoColors.systemOrange,);

  CupertinoThemeData get theme => isDark ? dark : light;

  swithTheme(){
    isDark = !isDark;
  }
}