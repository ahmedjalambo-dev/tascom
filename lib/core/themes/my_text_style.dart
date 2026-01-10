import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// The font family specified in the design.
const String kFontFamily = 'Poppins';

/// A class that holds the text styles from the Typography_Mobile design.
///
/// This class is not meant to be instantiated. It provides static access
/// to the app's text styles, organized by category matching the design system.
///
/// Example:
/// ```
/// Text(
///   'Hello World',
///   style: MyTextStyle.heading.h1,
/// )
/// ```
class MyTextStyle {
  // Private constructor to prevent instantiation.
  MyTextStyle._();

  /// 'Heading' text styles (H1, H2.1, H2.2, H3.1, H3.2).
  static AppHeadingStyles heading = AppHeadingStyles._();

  /// 'Body' text styles (Body.1, Body.2).
  static AppBodyStyles body = AppBodyStyles._();

  /// 'Button' text styles (PrimaryButton.1, SecondaryButton.2, SmallButtons).
  static AppButtonStyles button = AppButtonStyles._();

  /// 'Label' text styles (Label.1, Label.2).
  static AppLabelStyles label = AppLabelStyles._();

  /// 'Caption' text styles (Caption/notes).
  static AppCaptionStyles caption = AppCaptionStyles._();
}

/// Helper class for 'Heading' text styles.
class AppHeadingStyles {
  AppHeadingStyles._();

  final TextStyle h1 = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w700, // Bold
    fontSize: 24.0.sp,
  );

  final TextStyle h21 = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 22.0.sp,
  );

  final TextStyle h22 = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 20.0.sp,
  );

  final TextStyle h31 = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w500, // Medium
    fontSize: 20.0.sp,
  );

  final TextStyle h32 = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w500, // Medium
    fontSize: 18.0.sp,
  );
}

/// Helper class for 'Body' text styles.
class AppBodyStyles {
  AppBodyStyles._();

  final TextStyle body1 = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w400, // Regular
    fontSize: 16.0.sp,
  );

  final TextStyle body2 = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w400, // Regular
    fontSize: 14.0.sp,
  );
}

/// Helper class for 'Button' text styles.
class AppButtonStyles {
  AppButtonStyles._();

  final TextStyle primaryButton1 = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 16.0.sp,
  );

  final TextStyle secondaryButton2 = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 14.0.sp,
  );

  final TextStyle smallButtons = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 12.0.sp,
  );
}

/// Helper class for 'Label' text styles.
class AppLabelStyles {
  AppLabelStyles._();

  final TextStyle label1 = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w500, // Medium
    fontSize: 12.0.sp,
  );

  final TextStyle label2 = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w500, // Medium
    fontSize: 10.0.sp,
  );
}

/// Helper class for 'Caption' text styles.
class AppCaptionStyles {
  AppCaptionStyles._();

  final TextStyle captionNotes = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w400, // Regular
    fontSize: 12.0.sp,
  );
}
