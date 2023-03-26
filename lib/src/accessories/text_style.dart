import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentz/src/accessories/color_pallette.dart';

class AppTextStyle {
  static TextStyle heading = GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.bold);
    static TextStyle primary = GoogleFonts.openSans(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: ColorPallette.primaryColor);
  static TextStyle rest = GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.normal);
}