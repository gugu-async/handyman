import 'package:flutter/material.dart';

class AppColors {
  static Color black = const Color(0xFF000000);
  static Color white = const Color(0xFFFFFFFF);
  static Color lightGreen = const Color(0xFFeaf7f0);

  //* Ligth
  static Color lightText = const Color(0xFF000000);
  static Color lightScaffold = const Color(0xFFe6ecf7);
  static Color lightPrimaryColor = const Color(0xFF02a468);

  static Color lightShadowColor = const Color(
    0xFFD3D6E0,
  ).withValues(alpha: 0.6);
  static Color lightCardColor = const Color(0xFFFFFFFF);
  static Color lightHintColor = const Color(0xFFdfdfdf);
  static Color lightDrawerColor = const Color(0xFFFFFFFF);
  static Color lightCanvasColor = const Color(0xFFeaf7f0);
  static Color lightDividerColor = const Color(0xFFdfdfdf);
  static Color lightIconColor = const Color(0x89000000);

  //* Dark
  static Color darkText = const Color(0xFFFFFFFF);
  static Color darkScaffold = const Color(0xFF20293d);
  static Color darkPrimaryColor = const Color(0xFF02a468);

  static Color darkShadowColor = const Color(0xFF201B2B).withValues(alpha: 0.6);
  static Color darkCardColor = const Color(0xFF323a4f);
  static Color darkHintColor = const Color(0xFF474f62);
  static Color darkDrawerColor = const Color(0xFF20293d);
  static Color darkCanvasColor = const Color(0xFF323a4f);
  static Color darkDividerColor = const Color(0xFF474f62);
  static Color darkIconColor = const Color(0xFFF1F1F1);

  static LinearGradient greenGradient = LinearGradient(
    colors: [const Color(0xFF6cbc58), lightPrimaryColor],
  );
  static LinearGradient greenGradient2 = LinearGradient(
    colors: [lightPrimaryColor, const Color(0xFF6cbc58)],
  );
}
