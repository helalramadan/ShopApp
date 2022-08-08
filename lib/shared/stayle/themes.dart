
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
);
ThemeData darkTheme = ThemeData(
primarySwatch: Colors.deepOrange,
appBarTheme: const AppBarTheme(
backwardsCompatibility: false,
systemOverlayStyle: SystemUiOverlayStyle(
statusBarColor: Color(0xFF333739),
statusBarIconBrightness: Brightness.dark,
),
titleTextStyle: TextStyle(
color: Colors.white,
fontSize: 20.0,
fontWeight: FontWeight.bold,
),
backgroundColor: Color(0xFF333739),
elevation: 0.0,
iconTheme: IconThemeData(
color: Colors.white,
),
),
floatingActionButtonTheme: const FloatingActionButtonThemeData(
backgroundColor: Colors.deepOrange,
),
bottomNavigationBarTheme: const BottomNavigationBarThemeData(
type: BottomNavigationBarType.fixed,
selectedItemColor: Colors.deepOrange,
unselectedItemColor: Colors.grey,
elevation: 20.0,
backgroundColor: Color(0xFF333739),
),
iconTheme: const IconThemeData(color: Colors.white, size: 25.0),
textTheme: const TextTheme(
bodyText1: TextStyle(
fontSize: 18.0,
fontWeight: FontWeight.w600,
color: Colors.white,
),
bodyText2: TextStyle(
fontSize: 25.0,
// fontWeight: FontWeight.w600,
color: Colors.white,
)),
scaffoldBackgroundColor: const Color(0xFF333739),
);