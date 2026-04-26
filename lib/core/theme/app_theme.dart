import 'package:flutter/material.dart';

// ─── Brand & Semantic Color Palette ──────────────────────────────────────────
/// All raw color values for the Cliniqara design system.
///
/// Use these only inside [AppTheme]. Feature code should reference
/// [Theme.of(context).colorScheme] or the semantic extension [AppColors].
abstract class _Palette {
  // Primary teal family
  static const Color teal900 = Color(0xFF1A4B4C);
  static const Color teal700 = Color(0xFF235E5F);
  static const Color teal600 = Color(0xFF2C7A7B); // Primary brand color
  static const Color teal400 = Color(0xFF4A9899);
  static const Color teal100 = Color(0xFFB2DFDF);
  static const Color teal50  = Color(0xFFE0F2F1);

  // Surface / Background
  static const Color offWhite    = Color(0xFFF3F4F6); // Background
  static const Color surfaceCard = Color(0xFFFFFFFF);
  static const Color surfaceDim  = Color(0xFFE8EAED);

  // Semantic
  static const Color successGreen = Color(0xFF2D9E5A); // Normal vitals
  static const Color warningAmber = Color(0xFFF59E0B); // Borderline
  static const Color errorRed     = Color(0xFFDC2626); // Critical / abnormal
  static const Color infoBlue     = Color(0xFF2563EB); // Info notices

  // Text
  static const Color textPrimary   = Color(0xFF1A202C);
  static const Color textSecondary = Color(0xFF4A5568);
  static const Color textDisabled  = Color(0xFF9CA3AF);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
}

// ─── App Theme ────────────────────────────────────────────────────────────────
/// Factory that produces the [ThemeData] used in [MaterialApp.theme].
abstract class AppTheme {

  static ThemeData get lightTheme {
    const ColorScheme colorScheme = ColorScheme(
      brightness: Brightness.light,

      // Primary
      primary: _Palette.teal600,
      onPrimary: _Palette.textOnPrimary,
      primaryContainer: _Palette.teal50,
      onPrimaryContainer: _Palette.teal900,

      // Secondary – slightly desaturated teal for chips, tabs, etc.
      secondary: _Palette.teal400,
      onSecondary: _Palette.textOnPrimary,
      secondaryContainer: _Palette.teal100,
      onSecondaryContainer: _Palette.teal900,

      // Tertiary – amber for warnings / highlights
      tertiary: _Palette.warningAmber,
      onTertiary: _Palette.textOnPrimary,
      tertiaryContainer: Color(0xFFFEF3C7),
      onTertiaryContainer: Color(0xFF78350F),

      // Error
      error: _Palette.errorRed,
      onError: _Palette.textOnPrimary,
      errorContainer: Color(0xFFFEE2E2),
      onErrorContainer: Color(0xFF7F1D1D),

      // Surface / Background
      surface: _Palette.surfaceCard,
      onSurface: _Palette.textPrimary,
      surfaceContainerHighest: _Palette.surfaceDim,
      onSurfaceVariant: _Palette.textSecondary,

      // Outline
      outline: Color(0xFFD1D5DB),
      outlineVariant: Color(0xFFE5E7EB),

      // Inverse
      inverseSurface: _Palette.teal900,
      onInverseSurface: _Palette.textOnPrimary,
      inversePrimary: _Palette.teal100,

      // Scrim / Shadow
      scrim: Color(0xFF000000),
      shadow: Color(0xFF000000),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,

      // ── Scaffold ────────────────────────────────────────────────────────────
      scaffoldBackgroundColor: _Palette.offWhite,

      // ── AppBar ──────────────────────────────────────────────────────────────
      appBarTheme: const AppBarTheme(
        backgroundColor: _Palette.teal600,
        foregroundColor: _Palette.textOnPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: _Palette.textOnPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
        ),
        iconTheme: IconThemeData(color: _Palette.textOnPrimary),
      ),

      // ── Cards ───────────────────────────────────────────────────────────────
      cardTheme: CardThemeData(
        color: _Palette.surfaceCard,
        elevation: 1,
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Color(0xFFE5E7EB), width: 1),
        ),
      ),

      // ── Input Fields ─────────────────────────────────────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _Palette.surfaceCard,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: _Palette.teal600, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: _Palette.errorRed),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: _Palette.errorRed, width: 2),
        ),
        labelStyle: const TextStyle(color: _Palette.textSecondary),
        hintStyle: const TextStyle(color: _Palette.textDisabled),
        errorStyle: const TextStyle(color: _Palette.errorRed, fontSize: 12),
      ),

      // ── Elevated Button ──────────────────────────────────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _Palette.teal600,
          foregroundColor: _Palette.textOnPrimary,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),

      // ── Outlined Button ──────────────────────────────────────────────────────
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: _Palette.teal600,
          side: const BorderSide(color: _Palette.teal600, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),

      // ── Text Button ──────────────────────────────────────────────────────────
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _Palette.teal600,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),

      // ── Chip ──────────────────────────────────────────────────────────────────
      chipTheme: ChipThemeData(
        backgroundColor: _Palette.teal50,
        selectedColor: _Palette.teal600,
        labelStyle: const TextStyle(
          color: _Palette.teal700,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: _Palette.teal100),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      ),

      // ── Divider ───────────────────────────────────────────────────────────────
      dividerTheme: const DividerThemeData(
        color: Color(0xFFE5E7EB),
        thickness: 1,
        space: 1,
      ),

      // ── Typography ────────────────────────────────────────────────────────────
      // ScreenUtil values are set at widget level; use sp/dp via extensions.
      textTheme: const TextTheme(
        displayLarge:  TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: _Palette.textPrimary),
        displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: _Palette.textPrimary),
        headlineLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: _Palette.textPrimary),
        headlineMedium:TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: _Palette.textPrimary),
        headlineSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: _Palette.textPrimary),
        titleLarge:    TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: _Palette.textPrimary),
        titleMedium:   TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: _Palette.textPrimary),
        titleSmall:    TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: _Palette.textSecondary),
        bodyLarge:     TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: _Palette.textPrimary),
        bodyMedium:    TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: _Palette.textPrimary),
        bodySmall:     TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: _Palette.textSecondary),
        labelLarge:    TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: _Palette.textPrimary),
        labelMedium:   TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: _Palette.textSecondary),
        labelSmall:    TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: _Palette.textDisabled),
      ),
    );
  }
}

// ─── Semantic Color Extension ─────────────────────────────────────────────────
/// Access clinical semantic colors without going through [ColorScheme].
///
/// Usage: `context.appColors.success`
extension AppColorsExtension on BuildContext {
  AppColors get appColors => const AppColors();
}

/// Semantic colors for clinical contexts (vitals, alerts, status badges).
class AppColors {
  const AppColors();

  /// Indicates normal / healthy vitals or a completed action.
  Color get success => _Palette.successGreen;

  /// Indicates borderline vitals or a pending action.
  Color get warning => _Palette.warningAmber;

  /// Indicates critically abnormal vitals or a destructive action.
  Color get error => _Palette.errorRed;

  /// General informational notices.
  Color get info => _Palette.infoBlue;

  /// Main brand teal.
  Color get primary => _Palette.teal600;

  /// Off-white scaffold background.
  Color get background => _Palette.offWhite;
}
