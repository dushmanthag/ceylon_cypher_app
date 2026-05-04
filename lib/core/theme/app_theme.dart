import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // DARK MODE (The "Underground" Vibe)
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: AppColors.primaryOrange,
        surface: AppColors.oceanBlue,
        background: AppColors.skyBlue,
      ),
      scaffoldBackgroundColor: AppColors.skyBlue,
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryOrange,
        elevation: 0,
        centerTitle: false,
      ),
    );
  }

  // LIGHT MODE (The "Technical" Vibe)
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryOrange,
        surface: AppColors.skyBlue,
        background: AppColors.skyBlue,
      ),
      scaffoldBackgroundColor: AppColors.backgroundWhite,
      textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme),
    );
  }
}
