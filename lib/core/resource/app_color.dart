import 'package:flutter/material.dart';

class AppColor {
  AppColor._internal();

  static final AppColor _instance = AppColor._internal();

  factory AppColor() {
    return _instance;
  }

  // ============================================================
  // App Colors
  // ============================================================

  static const Color appPrimary = Color(0xFFFBF4ED);
  static const Color appButton = Color(0xFFE7B88B);
  static const Color appBackground = Color(0xFFFEFEFE);

  // Primary colors
  static const Color primary = Color(0xFFFBF4ED);
  static const Color primary2 = Color(0x9DECDDA6);
  static const Color secondary = Color(0xFFE7B88B);

  // Scaffold colors
  static const Color primaryScaffoldColor = Color(0xFFFEFEFE);
  static const Color secondaryScaffoldColor = Color(0xFFFFFFFF);

  // ============================================================
  // Basic Colors
  // ============================================================

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Color(0x00000000);

  static const Color black20 = Color(0xFF202020);
  static const Color black40 = Color(0xFF22272B);
  static const Color black50 = Color(0xFF252525);
  static const Color shadow = Color(0xFFC6C6C6);

  // Background colors
  static const Color darkBackground = Color(0xFF0E0E0E);
  static const Color lightBackground = Color(0xFFF0F0F0);
  static const Color base = Color(0xFFF5F5F5);

  // ============================================================
  // Grey Colors
  // ============================================================

  static const Color grey = Color(0xFFF1F1F1);
  static const Color lightGrey = Color(0xFFD9D9D9);
  static const Color lightGrey50 = Color(0xFFA4A6B0);
  static const Color lightGrey80 = Color(0xFFE2E3E6);
  static const Color lightGrey70 = Color(0xFFE5E5E5);
  static const Color lightGrey90 = Color(0xFFE0E0E0);
  static const Color lightGreyShade = Color(0xFFF6F6F6);

  static const Color greyshade1 = Color(0xFF434449);
  static const Color greyshade2 = Color(0xFF696969);
  static const Color greyshade3 = Color(0xFF949494);
  static const Color greyshade4 = Color(0xFFDADADA);
  static const Color darkGrey = Color(0xFF202124);

  // Existing aliases
  static const Color highlight = grey;
  static const Color highlightText = black;

  // ============================================================
  // Text Colors
  // ============================================================

  static const Color primaryText = Color(0xFF36454F);
  static const Color primaryTextColor = Color(0xFF36454F);

  static const Color secondaryText = Color(0xFF5A6981);
  static const Color headingText = Color(0xFF36454F);
  static const Color baseText = Color(0xFF36454F);
  static const Color disabledText = Color(0xFF90A4AE);

  static const Color errorText = Color(0xFFFF0000);

  // ============================================================
  // Status Colors
  // ============================================================

  static const Color yellow = Color(0xFFF2C94C);
  static const Color red = Color(0xFFFF0000);
  static const Color green = Color(0xFF4BB543);

  static const Color success = Color(0xFF4BB543);

  // ============================================================
  // Other Colors
  // ============================================================

  static const Color berryline = Color(0xFF00EFEB);
  static const Color purple = Color(0xFFA020F0);
  static const Color blue = Color(0xFF19A2F1);
  static const Color lightBlue = Color(0xFF56B9F2);
  static const Color darkBlue = Color(0xFF004999);

  static const Color darkBrown = Color(0xA64E291E);
  static const Color orange = Color(0xFFFF6801);

  static const Color iconColor = Color(0xFF000000);

  // ============================================================
  // Shimmer Colors
  // ============================================================

  static const Color lightShimmerBaseColor = Color(0xFFE0E0E0);
  static const Color lightShimmerHighlightColor = Color(0xFFF5F5F5);

  static const Color darkShimmerBaseColor = Color(0xFF424242);
  static const Color darkShimmerHighlightColor = Color(0xFF757575);

  // ============================================================
  // Gradient Colors
  // ============================================================

  static const Color primaryGradient1 = Color(0xFF004999);
  static const Color primaryGradient2 = Color(0xFF00EFEB);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [primaryGradient1, primaryGradient2],
  );

  // Existing gradient
  static const LinearGradient iconBgGradient = LinearGradient(
    colors: [primaryGradient1, primaryGradient2],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ============================================================
  // Compatibility
  // ============================================================

  static Color? get highlightdark => null;
}
