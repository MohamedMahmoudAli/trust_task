import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFFD32F2F); // Example Burger Red
  static const secondaryColor = Color(0xFFFFC107); // Example Mustard Yellow

  static ThemeData get light {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      // Add more styling here
    );
  }
}