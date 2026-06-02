import 'package:flutter/material.dart';

abstract final class AppColors {
  // --- Brand Colors (From 'Clinical Precision' System) ---
  static const Color primary = Color(
    0xFF2563EB,
  ); // Main interactive elements, buttons
  static const Color secondary = Color(0xFF14B8A6); // Accents, success states
  static const Color tertiary = Color(0xFFBC4800); // Warnings, highlights

  // --- Semantic Colors ---
  static const Color error = Color(
    0xFFBA1A1A,
  ); // Used for the '*' in required form fields

  // --- Backgrounds & Surfaces (From Figma UI) ---
  static const Color background = Color(0xFFF8FAFC); // Main app background
  static const Color surface = Color(
    0xFFFFFFFF,
  ); // Card and container backgrounds
  static const Color inputSurface = Color(0xFFF1F5F9); // Text field backgrounds

  // --- Borders & Dividers ---
  static const Color border = Color(
    0xFFE2E8F0,
  ); // Form field borders, container outlines
  static const Color primaryLight = Color(
    0x192563EB,
  ); // Light blue background for selected gender card
  static const Color primaryBorder = Color(
    0xFF004AC6,
  ); // Darker blue border for selected gender card

  // --- Typography (From Figma UI) ---
  static const Color textPrimary = Color(
    0xFF191B23,
  ); // Main headings and labels
  static const Color textSecondary = Color(
    0xFF64748B,
  ); // Subtitles, inactive text
  static const Color textTertiary = Color(0xFF737686); // Helper text
  static const Color textHint = Color(
    0xFF94A3B8,
  ); // Placeholder text like "(Optional)"
}
