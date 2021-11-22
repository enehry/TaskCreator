import 'package:flutter/material.dart';

class AppTheme {
  ThemeData light() => ThemeData(
          textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Poppins'),
        headline2: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontFamily: 'Poppins'),
        bodyText1: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
          fontFamily: 'Poppins',
        ),
      ));

  ThemeData dark() => ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Poppins'),
          headline2: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontFamily: 'Poppins'),
          bodyText1: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
      );
}
