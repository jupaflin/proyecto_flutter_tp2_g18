import 'package:flutter/material.dart';

class DefaultTheme {
  static const Color primaryDark = Colors.red;
  static const Color secondary = Colors.grey;
  static const Color formElementsColor = Colors.purple;
  static final Color primaryHover = Colors.red.shade600;

  static final ThemeData lightTheme = ThemeData.light().copyWith();

  static final ThemeData darkTheme = ThemeData.dark().copyWith();
    
}
