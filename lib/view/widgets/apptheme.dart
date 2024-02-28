import 'package:flutter/material.dart';

enum AppTheme {
  darkTheme,
  lightTheme,
}

class AppThemes {
  static final appThemeData = {
    AppTheme.darkTheme: ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      dividerColor: Colors.black54,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(100, 35)),
          backgroundColor:
              MaterialStateProperty.all(const Color.fromARGB(255, 56, 56, 56)),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 70, 70, 70),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Color.fromARGB(255, 194, 8, 8),
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white, size: 30),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        backgroundColor: Colors.black,
        elevation: 5,
        shadowColor: Color.fromARGB(255, 88, 88, 88),
      ),
    ),
    AppTheme.lightTheme: ThemeData(
      primarySwatch: Colors.green,
      primaryColor: Colors.green,
      brightness: Brightness.light,
      dividerColor: const Color(0xff757575),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF9395D3),
        foregroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.black),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(100, 35)),
          backgroundColor: MaterialStateProperty.all(const Color(0xFF9395D3)),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.black),
        bodySmall: TextStyle(color: Colors.black),
        bodyLarge: TextStyle(color: Colors.black),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 116, 171, 99),
        unselectedItemColor: Colors.white,
        selectedItemColor: Color.fromARGB(255, 194, 8, 8),
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white, size: 30),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        backgroundColor: Color.fromARGB(255, 40, 208, 71),
        elevation: 5,
        shadowColor: Colors.black,
      ),
    ),
  };
}
