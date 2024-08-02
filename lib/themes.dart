import 'package:flutter/material.dart';

class Themes {
  static ColorScheme myThemeColorScheme = const ColorScheme(
    brightness: Brightness.dark,
    primary: Color.fromRGBO(35, 36, 41, 1),
    onPrimary: Color.fromRGBO(227, 228, 228, 1),
    secondary: Color.fromRGBO(35, 36, 41, 1),
    onSecondary: Color.fromRGBO(227, 228, 228, 1),
    error: Color.fromRGBO(214, 76, 76, 1),
    onError: Color.fromRGBO(35, 36, 41, 1),
    background: Color.fromRGBO(26, 27, 31, 1),
    onBackground: Color.fromRGBO(227, 228, 228, 1),
    surface: Color.fromRGBO(35, 36, 41, 1),
    onSurface: Color.fromRGBO(227, 228, 228, 1),
  );

  static TextTheme myThemeTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: "InriaSans",
      color: myThemeColorScheme.onPrimary,
      fontSize: 36,
      fontWeight: FontWeight.bold,
    ),
		displayMedium: TextStyle(
      fontFamily: "InriaSans",
      color: myThemeColorScheme.onPrimary,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      fontFamily: "InriaSans",
      color: Color.fromRGBO(
        myThemeColorScheme.onPrimary.red,
        myThemeColorScheme.onPrimary.green,
        myThemeColorScheme.onPrimary.blue,
        50,
      ),
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  );

  static ThemeData myTheme = ThemeData(
    colorScheme: myThemeColorScheme,
    cardColor: myThemeColorScheme.surface,
    textTheme: myThemeTextTheme,
    fontFamily: "InriaSans",
  );
}
