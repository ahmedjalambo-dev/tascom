import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

/// Dark theme specific colors
/// Since my_colors.dart only defines light theme colors, we define dark surfaces here
class _DarkColors {
  static const Color surface = Color(0xFF1A1625);
  static const Color background = Color(0xFF0F0B15);
  static const Color surfaceVariant = Color(0xFF2A2535);
  static const Color inputFill = Color(0xFF2A2535);
}

class MyTheme {
  // ==========================
  // LIGHT THEME
  // ==========================
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: kFontFamily,

      // 1. Color Scheme
      colorScheme: ColorScheme.light(
        primary: MyColors.brand.purple,
        onPrimary: MyColors.text.white,
        secondary: MyColors.status.inProgress,
        onSecondary: MyColors.text.white,
        error: MyColors.states.error,
        onError: MyColors.text.white,
        tertiary: MyColors.states.success,
        onTertiary: MyColors.text.white,
        surface: MyColors.background.secondary,
        onSurface: MyColors.text.primary,
        surfaceContainerHighest: MyColors.background.cardHover,
        onSurfaceVariant: MyColors.text.secondary,
        outline: MyColors.border.border,
        outlineVariant: MyColors.border.postBorder,
        shadow: MyColors.text.primary.withValues(alpha: 0.1),
        scrim: MyColors.text.primary.withValues(alpha: 0.4),
      ),

      // 2. Scaffold background
      scaffoldBackgroundColor: MyColors.background.primary,

      // 3. AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: MyColors.background.secondary,
        foregroundColor: MyColors.text.primary,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(color: MyColors.icons.icon),
        titleTextStyle: MyTextStyle.heading.h21.copyWith(
          color: MyColors.text.primary,
        ),
      ),

      // 4. Card
      cardTheme: CardThemeData(
        color: MyColors.background.secondary,
        surfaceTintColor: Colors.transparent,
        elevation: 1,
        shadowColor: MyColors.text.primary.withValues(alpha: 0.08),
        margin: EdgeInsets.symmetric(vertical: 8.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),

      // 5. Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: MyColors.background.secondary,
        hintStyle: MyTextStyle.body.body2.copyWith(color: MyColors.text.third),
        labelStyle: MyTextStyle.body.body2.copyWith(
          color: MyColors.text.secondary,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.dg),
          borderSide: BorderSide(color: MyColors.border.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.dg),
          borderSide: BorderSide(color: MyColors.border.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.dg),
          borderSide: BorderSide(color: MyColors.brand.purple, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.dg),
          borderSide: BorderSide(color: MyColors.states.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.dg),
          borderSide: BorderSide(color: MyColors.states.error, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.dg),
          borderSide: BorderSide(color: MyColors.text.disable),
        ),
      ),

      // 6. Text Theme
      textTheme: TextTheme(
        displayLarge: MyTextStyle.heading.h1.copyWith(
          color: MyColors.text.primary,
        ),
        displayMedium: MyTextStyle.heading.h21.copyWith(
          color: MyColors.text.primary,
        ),
        displaySmall: MyTextStyle.heading.h22.copyWith(
          color: MyColors.text.primary,
        ),
        headlineMedium: MyTextStyle.heading.h31.copyWith(
          color: MyColors.text.primary,
        ),
        headlineSmall: MyTextStyle.heading.h32.copyWith(
          color: MyColors.text.primary,
        ),
        titleLarge: MyTextStyle.heading.h32.copyWith(
          color: MyColors.text.primary,
        ),
        titleMedium: MyTextStyle.body.body1.copyWith(
          color: MyColors.text.primary,
        ),
        titleSmall: MyTextStyle.body.body2.copyWith(
          color: MyColors.text.primary,
        ),
        bodyLarge: MyTextStyle.body.body1.copyWith(
          color: MyColors.text.secondary,
        ),
        bodyMedium: MyTextStyle.body.body2.copyWith(
          color: MyColors.text.secondary,
        ),
        bodySmall: MyTextStyle.label.label1.copyWith(
          color: MyColors.text.third,
        ),
        labelLarge: MyTextStyle.button.primaryButton1.copyWith(
          color: MyColors.text.primary,
        ),
        labelMedium: MyTextStyle.label.label1.copyWith(
          color: MyColors.text.secondary,
        ),
        labelSmall: MyTextStyle.label.label2.copyWith(
          color: MyColors.text.third,
        ),
      ),

      // 7. Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.brand.purple,
          foregroundColor: MyColors.text.white,
          elevation: 2,
          shadowColor: MyColors.brand.purple.withValues(alpha: 0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(103.dg),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
          textStyle: MyTextStyle.button.primaryButton1,
        ),
      ),

      // 8. Text Button
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: MyColors.brand.purple,
          textStyle: MyTextStyle.button.secondaryButton2,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        ),
      ),

      // 9. Outlined Button
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: MyColors.brand.purple,
          side: BorderSide(color: MyColors.brand.purple, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
          textStyle: MyTextStyle.button.primaryButton1,
        ),
      ),

      // 10. Icon Theme
      iconTheme: IconThemeData(color: MyColors.icons.icon, size: 24),

      // 11. Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: MyColors.background.cardHover,
        labelStyle: MyTextStyle.label.label1.copyWith(
          color: MyColors.brand.purple,
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        side: BorderSide.none,
        selectedColor: MyColors.brand.purple,
        checkmarkColor: MyColors.text.white,
      ),

      // 12. Divider Theme
      dividerTheme: DividerThemeData(
        color: MyColors.border.postBorder,
        thickness: 1,
        space: 1,
      ),

      // 13. Bottom Navigation Bar Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: MyColors.background.secondary,
        selectedItemColor: MyColors.brand.purple,
        unselectedItemColor: MyColors.text.third,
        selectedLabelStyle: MyTextStyle.label.label1,
        unselectedLabelStyle: MyTextStyle.label.label2,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
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
      colorScheme: ColorScheme.dark(
        primary: MyColors.brand.purple,
        onPrimary: MyColors.text.white,
        secondary: MyColors.status.inProgress,
        onSecondary: MyColors.text.primary,
        error: MyColors.states.error,
        onError: MyColors.text.white,
        tertiary: MyColors.states.success,
        onTertiary: MyColors.text.primary,
        surface: _DarkColors.surface,
        onSurface: MyColors.text.white,
        surfaceContainerHighest: _DarkColors.surfaceVariant,
        onSurfaceVariant: MyColors.text.third,
        outline: MyColors.text.secondary,
        outlineVariant: MyColors.text.third.withValues(alpha: 0.3),
        shadow: Colors.black.withValues(alpha: 0.5),
        scrim: Colors.black.withValues(alpha: 0.6),
      ),

      // 2. Scaffold background
      scaffoldBackgroundColor: _DarkColors.background,

      // 3. AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: _DarkColors.surface,
        foregroundColor: MyColors.text.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(color: MyColors.text.white),
        titleTextStyle: MyTextStyle.heading.h21.copyWith(
          color: MyColors.text.white,
        ),
      ),

      // 4. Card
      cardTheme: CardThemeData(
        color: _DarkColors.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.symmetric(vertical: 8.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
          side: BorderSide(color: MyColors.text.third.withValues(alpha: 0.15)),
        ),
      ),

      // 5. Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _DarkColors.inputFill,
        hintStyle: MyTextStyle.body.body2.copyWith(color: MyColors.text.third),
        labelStyle: MyTextStyle.body.body2.copyWith(color: MyColors.text.white),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.dg),
          borderSide: BorderSide(color: MyColors.text.secondary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.dg),
          borderSide: BorderSide(color: MyColors.text.secondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.dg),
          borderSide: BorderSide(color: MyColors.brand.purple, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.dg),
          borderSide: BorderSide(color: MyColors.states.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.dg),
          borderSide: BorderSide(color: MyColors.states.error, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.dg),
          borderSide: BorderSide(
            color: MyColors.text.third.withValues(alpha: 0.3),
          ),
        ),
      ),

      // 6. Text Theme
      textTheme: TextTheme(
        displayLarge: MyTextStyle.heading.h1.copyWith(
          color: MyColors.text.white,
        ),
        displayMedium: MyTextStyle.heading.h21.copyWith(
          color: MyColors.text.white,
        ),
        displaySmall: MyTextStyle.heading.h22.copyWith(
          color: MyColors.text.white,
        ),
        headlineMedium: MyTextStyle.heading.h31.copyWith(
          color: MyColors.text.white,
        ),
        headlineSmall: MyTextStyle.heading.h32.copyWith(
          color: MyColors.text.white,
        ),
        titleLarge: MyTextStyle.heading.h32.copyWith(
          color: MyColors.text.white,
        ),
        titleMedium: MyTextStyle.body.body1.copyWith(
          color: MyColors.text.white,
        ),
        titleSmall: MyTextStyle.body.body2.copyWith(color: MyColors.text.white),
        bodyLarge: MyTextStyle.body.body1.copyWith(color: MyColors.text.third),
        bodyMedium: MyTextStyle.body.body2.copyWith(color: MyColors.text.third),
        bodySmall: MyTextStyle.label.label1.copyWith(
          color: MyColors.text.disable,
        ),
        labelLarge: MyTextStyle.button.primaryButton1.copyWith(
          color: MyColors.text.white,
        ),
        labelMedium: MyTextStyle.label.label1.copyWith(
          color: MyColors.text.third,
        ),
        labelSmall: MyTextStyle.label.label2.copyWith(
          color: MyColors.text.disable,
        ),
      ),

      // 7. Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.brand.purple,
          foregroundColor: MyColors.text.white,
          elevation: 2,
          shadowColor: MyColors.brand.purple.withValues(alpha: 0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(103.dg),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
          textStyle: MyTextStyle.button.primaryButton1,
        ),
      ),

      // 8. Text Button
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: MyColors.brand.purple,
          textStyle: MyTextStyle.button.secondaryButton2,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        ),
      ),

      // 9. Outlined Button
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: MyColors.brand.purple,
          side: BorderSide(color: MyColors.brand.purple, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
          textStyle: MyTextStyle.button.primaryButton1,
        ),
      ),

      // 10. Icon Theme
      iconTheme: IconThemeData(color: MyColors.text.white, size: 24),

      // 11. Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: _DarkColors.surfaceVariant,
        labelStyle: MyTextStyle.label.label1.copyWith(
          color: MyColors.text.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        side: BorderSide(color: MyColors.text.secondary.withValues(alpha: 0.3)),
        selectedColor: MyColors.brand.purple,
        checkmarkColor: MyColors.text.white,
      ),

      // 12. Divider Theme
      dividerTheme: DividerThemeData(
        color: MyColors.text.third.withValues(alpha: 0.2),
        thickness: 1,
        space: 1,
      ),

      // 13. Bottom Navigation Bar Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: _DarkColors.surface,
        selectedItemColor: MyColors.brand.purple,
        unselectedItemColor: MyColors.text.third,
        selectedLabelStyle: MyTextStyle.label.label1,
        unselectedLabelStyle: MyTextStyle.label.label2,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
    );
  }
}
