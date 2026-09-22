import 'package:flutter/material.dart';

abstract final class AppColors {
  static const background = Color(0xFF111315);
  static const surface = Color(0xFF1A1D20);
  static const surfaceRaised = Color(0xFF23272A);
  static const outline = Color(0xFF697177);
  static const text = Color(0xFFF3F1EA);
  static const mutedText = Color(0xFFADB3B5);
  static const accent = Color(0xFFE5B86C);
}

abstract final class AppTheme {
  static ThemeData get dark {
    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.accent,
      brightness: Brightness.dark,
      surface: AppColors.surface,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme.copyWith(
        surface: AppColors.surface,
        onSurface: AppColors.text,
        primary: AppColors.accent,
        onPrimary: AppColors.background,
      ),
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: 'Georgia',
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          color: AppColors.text,
          fontSize: 28,
          fontWeight: FontWeight.w700,
          height: 1.1,
        ),
        titleLarge: TextStyle(
          color: AppColors.text,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        bodyLarge: TextStyle(color: AppColors.text, fontSize: 17, height: 1.45),
        bodyMedium: TextStyle(
          color: AppColors.mutedText,
          fontSize: 15,
          height: 1.45,
        ),
      ),
    );
  }
}
