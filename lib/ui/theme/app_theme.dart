import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        // primarySwatch: Colors.green,
        brightness: Brightness.light,
      ).copyWith(
        onPrimary: Colors.black,
        secondary: Colors.grey[900],
      ),
      textTheme: ThemeData.light().textTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color.fromRGBO(30, 31, 37, 0.2),
        elevation: 1,
      ),
      primaryColor: Colors.grey,
      scaffoldBackgroundColor: const Color.fromRGBO(30, 31, 37, 1),
      textTheme: ThemeData.dark().textTheme,
    );
  }
}
