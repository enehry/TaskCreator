import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData light() => ThemeData(
          textTheme: TextTheme(
        headline1: GoogleFonts.poppins(
          fontSize: 50.0,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        headline2: GoogleFonts.poppins(
            fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.black),
        bodyText1: GoogleFonts.poppins(fontSize: 20.0, color: Colors.black),
      ));

  ThemeData dark() => ThemeData.dark().copyWith(
          textTheme: TextTheme(
        headline1: GoogleFonts.poppins(
            fontSize: 50.0, fontWeight: FontWeight.w400, color: Colors.white),
        headline2: GoogleFonts.poppins(
            fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.white),
        bodyText1: GoogleFonts.poppins(fontSize: 20.0, color: Colors.white),
      ));
}
