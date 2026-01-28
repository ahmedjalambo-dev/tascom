import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';

class MyThemes {
  // ==========================
  // LIGHT THEME
  // ==========================
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: kFontFamily,

      // 1. Color Scheme
      colorScheme: ColorScheme.fromSeed(
        seedColor: MyColors.brand.purple,
        primary: MyColors.brand.purple,
        secondary: MyColors.text.secondary,
        surface: MyColors.background.secondary,
        error: MyColors.states.error,
        brightness: Brightness.light,
      ),

      // Scaffold background
      scaffoldBackgroundColor: MyColors.background.primary,

      // 2. AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: MyColors.background.secondary,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: MyColors.text.primary),
        titleTextStyle: MyTextStyles.heading.h21.copyWith(
          color: MyColors.text.primary,
        ),
      ),

      // 3. Card
      cardTheme: CardThemeData(
        color: MyColors.background.secondary,
        surfaceTintColor: Colors.transparent,
        elevation: 1,
        margin: EdgeInsets.symmetric(vertical: 8.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.dg),
        ),
      ),

      // 4. Inputs
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: MyColors.background.secondary,
        hintStyle: MyTextStyles.body.body1.copyWith(color: MyColors.text.third),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 16.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.dg),
          borderSide: BorderSide(color: MyColors.border.border, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.dg),
          borderSide: BorderSide(color: MyColors.border.border, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.dg),
          borderSide: BorderSide(color: MyColors.brand.purple, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.dg),
          borderSide: BorderSide(color: MyColors.states.error, width: 2),
        ),
      ),

      // 5. Text
      textTheme: TextTheme(
        titleMedium: MyTextStyles.heading.h31.copyWith(
          color: MyColors.text.primary,
        ),
        bodyMedium: MyTextStyles.body.body1.copyWith(
          color: MyColors.text.secondary,
        ),
        bodySmall: MyTextStyles.body.body2.copyWith(color: MyColors.text.third),
      ),

      // 6. Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.brand.purple,
          foregroundColor: MyColors.text.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.dg),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.w),
          textStyle: MyTextStyles.button.primaryButton1,
        ),
      ),
    );
  }

  // ==========================
  // DARK THEME
  // ==========================
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: kFontFamily,

      // 1. Color Scheme
      colorScheme: ColorScheme.fromSeed(
        seedColor: MyColors.brand.purple,
        primary: MyColors.brand.purple,
        secondary: MyColors.text.third,
        surface: const Color(0xFF2C2C2C),
        error: MyColors.states.error,
        brightness: Brightness.dark,
      ),

      // Scaffold background
      scaffoldBackgroundColor: const Color(0xFF1F2024),

      // 2. AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF1F2024),
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: MyColors.text.white),
        titleTextStyle: MyTextStyles.heading.h21.copyWith(
          color: MyColors.text.white,
        ),
      ),

      // 3. Card
      cardTheme: CardThemeData(
        color: const Color(0xFF2C2C2C),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.symmetric(vertical: 8.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.dg),
          side: BorderSide(color: MyColors.text.white.withValues(alpha: 0.05)),
        ),
      ),

      // 4. Inputs
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF2C2C2C),
        hintStyle: MyTextStyles.body.body1.copyWith(color: MyColors.text.third),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.dg),
          borderSide: BorderSide(color: MyColors.text.secondary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.dg),
          borderSide: BorderSide(color: MyColors.text.secondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.dg),
          borderSide: BorderSide(color: MyColors.brand.purple),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.dg),
          borderSide: BorderSide(color: MyColors.states.error),
        ),
      ),

      // 5. Text
      textTheme: TextTheme(
        titleMedium: MyTextStyles.heading.h31.copyWith(
          color: MyColors.text.white,
        ),
        bodyMedium: MyTextStyles.body.body1.copyWith(
          color: MyColors.text.third,
        ),
        bodySmall: MyTextStyles.body.body2.copyWith(
          color: MyColors.text.disable,
        ),
      ),

      // 6. Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.brand.purple,
          foregroundColor: MyColors.text.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.dg),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.w),
          textStyle: MyTextStyles.button.primaryButton1,
        ),
      ),

      // 7. Icon Theme
      iconTheme: IconThemeData(color: MyColors.text.third),

      // 8. Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: const Color(0xFF2C2C2C),
        labelStyle: MyTextStyles.body.body2.copyWith(
          color: MyColors.text.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.dg),
        ),
      ),
    );
  }

  /// Returns theme with locale-aware font family
  static ThemeData getTheme({
    required Brightness brightness,
    required Locale locale,
  }) {
    if (brightness == Brightness.light) {
      return lightTheme.copyWith(textTheme: lightTheme.textTheme);
    } else {
      return darkTheme.copyWith(textTheme: darkTheme.textTheme);
    }
  }
}
