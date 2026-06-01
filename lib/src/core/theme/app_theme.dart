import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:handyman/src/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.lightScaffold,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: AppColors.black,
      displayColor: AppColors.black,
    ),
    primaryColor: AppColors.lightPrimaryColor,
    shadowColor: AppColors.lightShadowColor,
    cardColor: AppColors.lightCardColor,
    hintColor: AppColors.lightHintColor,
    drawerTheme: DrawerThemeData(backgroundColor: AppColors.lightDrawerColor),
    canvasColor: AppColors.lightCanvasColor,
    dividerTheme: DividerThemeData(color: AppColors.lightDividerColor),
    tabBarTheme: TabBarThemeData(
      unselectedLabelColor: AppColors.black.withValues(alpha: 0.6),
      labelColor: AppColors.lightPrimaryColor,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: AppColors.lightPrimaryColor, width: 2),
      ),
    ),
    iconTheme: IconThemeData(color: AppColors.lightIconColor),
  );

  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: AppColors.darkScaffold,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: AppColors.darkText,
      displayColor: AppColors.darkText,
    ),
    primaryColor: AppColors.darkPrimaryColor,
    shadowColor: AppColors.darkShadowColor,
    cardColor: AppColors.darkCardColor,
    hintColor: AppColors.darkHintColor,
    drawerTheme: DrawerThemeData(backgroundColor: AppColors.darkDrawerColor),
    canvasColor: AppColors.darkCanvasColor,
    dividerTheme: DividerThemeData(color: AppColors.darkDividerColor),

    tabBarTheme: TabBarThemeData(
      unselectedLabelColor: AppColors.white..withValues(alpha: 0.6),
      labelColor: AppColors.lightPrimaryColor,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: AppColors.lightPrimaryColor, width: 2),
      ),
    ),
    iconTheme: IconThemeData(color: AppColors.darkIconColor),
  );
}
