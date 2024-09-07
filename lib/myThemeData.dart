import 'package:e_commerce/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static final ThemeData theme = ThemeData(
      primaryColor: AppColors.whiteColor,
      textTheme: TextTheme(
          bodyLarge: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
          ),
          bodyMedium: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          )));
}
