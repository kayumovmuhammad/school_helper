import 'package:flutter/material.dart';

final scaffoldBackgroundColor = Color.fromARGB(255, 243, 242, 248);

var lightThemeData = ThemeData(
  brightness: Brightness.light,
  iconTheme: IconThemeData(color: Colors.black),
  fontFamily: 'San Francisco',
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.orange,
    foregroundColor: Colors.white,
  ),
  primaryColor: Colors.black,
  scaffoldBackgroundColor: scaffoldBackgroundColor,
  textTheme: TextTheme(
    labelMedium: TextStyle(color: Colors.black, fontSize: 20),
    bodyMedium: TextStyle(color: Colors.black, fontSize: 18),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    titleMedium: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(color: Colors.black, fontSize: 16),
  ),
  appBarTheme: AppBarTheme(
    surfaceTintColor: scaffoldBackgroundColor,
    backgroundColor: scaffoldBackgroundColor,
    foregroundColor: Colors.black,
  ),
  listTileTheme: ListTileThemeData(
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Colors.blueAccent,
    unselectedItemColor: Colors.black,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(iconColor: Colors.black),
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
  ),
  cardTheme: CardTheme(color: Colors.white),
);

extension ThemeExtension on ThemeData {
  Color get secondaryColor => Colors.orange;
  Color get averageBaseChartColor =>
      (brightness == Brightness.light ? Colors.grey[300]! : Colors.grey);
  Color get underLineInputBorderEnabledColor => 
      (brightness == Brightness.light ? Colors.black: Colors.white);
}
