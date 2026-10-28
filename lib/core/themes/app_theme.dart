import 'package:flutter/material.dart';

class AppTheme {
  // Couleurs principales de la charte graphique
  static const Color primaryBlue = Color(0xFF1E3A8A); // Bleu nuit premium
  static const Color secondaryDark = Color(0xFF0F172A); // Noir / Sombre
  static const Color accentGreen = Color(0xFF10B981); // Vert accentuation
  static const Color backgroundColor = Color(0xFFF8FAFC); // Fond clair
  static const Color surfaceColor = Colors.white;

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryBlue,
        primary: primaryBlue,
        secondary: secondaryDark,
        tertiary: accentGreen,
        surface: surfaceColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: secondaryDark,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        ),
      ),
    );
  }
}