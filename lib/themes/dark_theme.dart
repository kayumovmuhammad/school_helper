import 'package:flutter/material.dart';

var darkThemeData = ThemeData(
  brightness: Brightness.dark,
  iconTheme: IconThemeData(color: Colors.white),
  fontFamily: 'San Francisco',
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.orange,
    foregroundColor: Colors.white,
  ),
  primaryColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  textTheme: TextTheme(
    labelMedium: TextStyle(color: Colors.white, fontSize: 20),
    bodyMedium: TextStyle(color: Colors.white, fontSize: 18),
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    titleMedium: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(color: Colors.white, fontSize: 16),
  ),
  appBarTheme: AppBarTheme(
    surfaceTintColor: Colors.black,
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
  ),
  listTileTheme: ListTileThemeData(
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    selectedItemColor: Colors.blueAccent,
    unselectedItemColor: Colors.white,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(iconColor: Colors.white),
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: const Color.fromARGB(255, 51, 51, 51),
  ),
  cardTheme: CardTheme(color: Color.fromARGB(255, 50, 50, 50)),
);
