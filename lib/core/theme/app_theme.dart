import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        surface: AppColors.surface,
      ),
      scaffoldBackgroundColor: AppColors.mist,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.bricolageGrotesque(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: AppColors.ink,
        ),
        displayMedium: GoogleFonts.bricolageGrotesque(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: AppColors.ink,
        ),
        titleLarge: GoogleFonts.bricolageGrotesque(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.ink,
        ),
        bodyLarge: GoogleFonts.dmSans(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: AppColors.ink,
        ),
        bodyMedium: GoogleFonts.dmSans(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: AppColors.inkSoft,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
