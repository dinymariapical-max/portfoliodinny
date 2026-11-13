// lib/theme/app_text_styles.dart
import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Semua text style menggunakan font system (tidak butuh google_fonts di sini).
/// google_fonts dipanggil langsung di widget masing-masing via GoogleFonts.nunito() / .pacifico().
class AppTextStyles {
  // Dipakai di name banner hero
  static const TextStyle nameLabel = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    letterSpacing: 0.5,
  );

  // Dipakai di pill badge
  static const TextStyle pillLabel = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.darkRed,
  );

  // Dipakai di AppBar
  static const TextStyle appBarTitle = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w700,
    fontSize: 18,
  );

  // Dipakai di judul halaman sub
  static const TextStyle pageTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    color: AppColors.darkRed,
  );

  // Dipakai di body text
  static const TextStyle bodyText = TextStyle(
    fontSize: 15,
    color: AppColors.black,
    height: 1.6,
  );

  // Dipakai di footer copyright
  static const TextStyle copyright = TextStyle(
    fontSize: 12,
    color: Color(0x8DFFFFFF), // white 55% opacity
  );
}
