import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  AppColors._();

  // ─── Backgrounds ────────────────────────────────────────────────────────────
  static const bg         = Color(0xFFFFF8F4); // warm cream background
  static const surface    = Color(0xFFFFFFFF); // white cards
  static const card       = Color(0xFFFFFFFF);
  static const cardBg     = Color(0xFFFFFFFF);
  static const peach      = Color(0xFFFFECE3); // soft peach tint
  static const lavender   = Color(0xFFEDE7FF); // soft lavender tint

  // ─── Borders & Dividers ──────────────────────────────────────────────────────
  static const border     = Color(0xFFF0E6E0);
  static const cardBorder = Color(0xFFF0E6E0);
  static const divider    = Color(0xFFF5EDE8);

  // ─── Primary — warm orange ───────────────────────────────────────────────────
  static const primary     = Color(0xFFFF6B35);
  static const primaryDark = Color(0xFFE55A25);
  static const primaryLight = Color(0xFFFF8C5A);
  static const accent      = Color(0xFFFF6B35);
  static const accentDim   = Color(0xFFE55A25);
  static const primaryPeach = Color(0xFFFFECE3);

  // ─── Secondary — lavender purple ────────────────────────────────────────────
  static const purple     = Color(0xFF7C5CBF);
  static const purpleLight = Color(0xFFEDE7FF);
  static const purpleMid  = Color(0xFFB09BE0);

  // ─── Status — green done state ───────────────────────────────────────────────
  static const done        = Color(0xFF4CAF50);
  static const doneDim     = Color(0xFF388E3C);
  static const success     = Color(0xFF4CAF50);
  static const successDark = Color(0xFF388E3C);
  static const successLight = Color(0xFFE8F5E9);
  static const error       = Color(0xFFE53935);

  // ─── Points — amber ──────────────────────────────────────────────────────────
  static const amber = Color(0xFFFF9800);
  static const gold  = Color(0xFFFF9800);

  // ─── Text ────────────────────────────────────────────────────────────────────
  static const t1            = Color(0xFF1A1A2E); // near-black headline
  static const t2            = Color(0xFF8A8A9A); // secondary grey
  static const t3            = Color(0xFFBEBECC); // muted hint
  static const textPrimary   = Color(0xFF1A1A2E);
  static const textSecondary = Color(0xFF8A8A9A);
  static const textMuted     = Color(0xFFBEBECC);

  // ─── Habit accent colors (warm palette) ──────────────────────────────────────
  static const List<Color> habitAccents = [
    Color(0xFFFF6B35), // orange
    Color(0xFF7C5CBF), // purple
    Color(0xFF4CAF50), // green
    Color(0xFF2196F3), // blue
    Color(0xFFFF9800), // amber
    Color(0xFFE91E63), // pink
    Color(0xFF00BCD4), // teal
    Color(0xFF795548), // brown
  ];

  static const List<Color> habitBgAccents = [
    Color(0xFFFFECE3),
    Color(0xFFEDE7FF),
    Color(0xFFE8F5E9),
    Color(0xFFE3F2FD),
    Color(0xFFFFF3E0),
    Color(0xFFFCE4EC),
    Color(0xFFE0F7FA),
    Color(0xFFEFEBE9),
  ];
}

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    final base = ThemeData.light();
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.bg,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.purple,
        surface: AppColors.surface,
        onPrimary: Colors.white,
        onSurface: AppColors.t1,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(base.textTheme).apply(
        bodyColor: AppColors.t1,
        displayColor: AppColors.t1,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        iconTheme: const IconThemeData(color: AppColors.t1),
        titleTextStyle: GoogleFonts.poppins(
          color: AppColors.t1,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
        ),
        labelStyle: const TextStyle(color: AppColors.t2, fontSize: 14),
        hintStyle: const TextStyle(color: AppColors.t3, fontSize: 14),
        errorStyle: const TextStyle(color: AppColors.error, fontSize: 12),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.t1,
        contentTextStyle:
            GoogleFonts.poppins(color: Colors.white, fontSize: 13),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 4,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.border),
          foregroundColor: AppColors.t2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }

  // Keep dark for backwards compat (alias to light now)
  static ThemeData get dark => light;
}
