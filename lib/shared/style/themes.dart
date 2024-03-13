import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF505050),
  colorScheme: ColorScheme.fromSeed(
    // seedColor: Color(0xFFBD00),
    seedColor: Colors.white,
  ),
  primarySwatch: Colors.blue,
  // scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: const Color(0xFF505050),
      statusBarBrightness: Brightness.light,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    backgroundColor: const Color(0xFF505050),
    titleTextStyle: TextStyle(
      fontFamily: 'Jahnna',
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    // color: Colors.green,
    elevation: 0.0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Color(0xFF505050),
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.grey,
  ),
  fontFamily: "Shiny",
  textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.grey,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      )),
);

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xFFBD00),
  ),

  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ),
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
      fontFamily: 'Jahnna',
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    // color: Colors.green,
    elevation: 0.0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.blue.shade400,
    elevation: 20.0,
  ),
  // bottoAppBarTheme: BottomAppBarTheme(
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    // backgroundColor: Color(0xFDA92F),
    backgroundColor: HexColor("#FFBF2F"),
  ),
  textTheme: const TextTheme(
    bodyLarge: const TextStyle(
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
    ),
  ),
  // ),
  fontFamily: "Jannah",
  // fontFamily: "Shiny",
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
);
