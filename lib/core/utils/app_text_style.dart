import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyle {
  //semiBold
  static TextStyle semiBold13 = GoogleFonts.cairo(
    fontWeight: FontWeight.w600,
    fontSize: 13,
  );
  static TextStyle semiBold11 = GoogleFonts.cairo(
    fontWeight: FontWeight.w600,
    fontSize: 11,
  );
  static TextStyle semiBold16 = GoogleFonts.cairo(
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );
  //bold
  static TextStyle bold13 = GoogleFonts.cairo(
    fontWeight: FontWeight.bold,
    fontSize: 13,
  );
  static TextStyle bold16 = GoogleFonts.cairo(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  static TextStyle bold19 = GoogleFonts.cairo(
    fontWeight: FontWeight.bold,
    fontSize: 19,
  );
  static TextStyle bold23 = GoogleFonts.cairo(
    fontWeight: FontWeight.bold,
    fontSize: 19,
  );
  static TextStyle bold28 = GoogleFonts.cairo(
    fontWeight: FontWeight.bold,
    fontSize: 28,
  );
  //headLine
  static TextStyle headLineReg = GoogleFonts.cairo(
    fontWeight: FontWeight.normal,
    fontSize: 19,
  );
  //req
  static TextStyle reg11 = GoogleFonts.cairo(
    fontWeight: FontWeight.normal,
    fontSize: 11,
  );
  static TextStyle regular13 = GoogleFonts.cairo(
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );
  static TextStyle reg16 = GoogleFonts.cairo(
    fontWeight: FontWeight.normal,
    fontSize: 16,
  );
  static TextStyle reg22 = GoogleFonts.cairo(
    fontWeight: FontWeight.normal,
    fontSize: 22,
  );
  static TextStyle reg26 = GoogleFonts.cairo(
    fontWeight: FontWeight.normal,
    fontSize: 26,
  );
  //medium
  static TextStyle med15 = GoogleFonts.cairo(
    fontWeight: FontWeight.w500,
    fontSize: 15,
  );
}
