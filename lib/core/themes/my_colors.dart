import 'package:flutter/material.dart';

/// A class that holds the color palette from the Figma design guide.
///
/// This class is not meant to be instantiated. It provides static access
/// to the app's colors, organized by category matching the design system.
///
/// Example:
/// ```dart
/// Container(
///   color: MyColors.brand.purple,
///   child: Text(
///     'Hello',
///     style: TextStyle(color: MyColors.text.primary),
///   ),
/// )
/// ```
class MyColors {
  // Private constructor to prevent instantiation.
  MyColors._();

  /// Status colors for task/item states.
  static const AppStatusColors status = AppStatusColors._();

  /// Text colors for different text hierarchies.
  static const AppTextColors text = AppTextColors._();

  /// Background colors for different surfaces.
  static const AppBackgroundColors background = AppBackgroundColors._();

  /// Border colors for dividers and outlines.
  static const AppBorderColors border = AppBorderColors._();

  /// Brand color - primary purple.
  static const AppBrandColors brand = AppBrandColors._();

  /// Icon colors for different icon states.
  static const AppIconColors icons = AppIconColors._();

  /// Priority colors for task priorities (high, medium, low).
  static const AppPriorityColors priority = AppPriorityColors._();

  /// State colors for UI states (disabled, error, success).
  static const AppStatesColors states = AppStatesColors._();
}

/// Helper class for 'Status' colors.
/// Used for task/item states like active, cancelled, completed, and in progress.
class AppStatusColors {
  const AppStatusColors._();

  /// Active status - Green (#09A632)
  final Color active = const Color(0xFF09A632);

  /// Cancelled status - Red (#C24141)
  final Color cancelled = const Color(0xFFC24141);

  /// Completed status - Blue (#2F5FE3)
  final Color completed = const Color(0xFF2F5FE3);

  /// In Progress status - Orange (#D97706)
  final Color inProgress = const Color(0xFFD97706);
}

/// Helper class for 'Text' colors.
/// Provides colors for different text hierarchies and states.
class AppTextColors {
  const AppTextColors._();

  /// Primary text color - Dark Purple (#251455)
  final Color primary = const Color(0xFF251455);

  /// Secondary text color - Gray (#6E6E6E)
  final Color secondary = const Color(0xFF6E6E6E);

  /// Third-level text color - Medium Gray (#B0B0B0)
  final Color third = const Color(0xFFB0B0B0);

  /// Disabled text color - Light Gray (#D7D9D9)
  final Color disable = const Color(0xFFD7D9D9);

  /// White text color (#FFFFFF)
  final Color white = const Color(0xFFFFFFFF);
}

/// Helper class for 'Background' colors.
/// Provides colors for different background surfaces.
class AppBackgroundColors {
  const AppBackgroundColors._();

  /// Primary background - Off-White (#F9F9FB)
  final Color primary = const Color(0xFFF9F9FB);

  /// Card/Hover background - Light Purple (#F4F0FF)
  final Color cardHover = const Color(0xFFF4F0FF);

  /// Secondary background (post bars) - White (#FFFFFF)
  final Color secondary = const Color(0xFFFFFFFF);
}

/// Helper class for 'Border' colors.
/// Provides colors for borders, dividers, and outlines.
class AppBorderColors {
  const AppBorderColors._();

  /// Standard border color - Light Gray (#DBDBDB)
  final Color border = const Color(0xFFDBDBDB);

  /// Post border color - Very Light Gray (#F1F0F0)
  final Color postBorder = const Color(0xFFF1F0F0);
}

/// Helper class for 'Brand' colors.
/// Contains the primary brand color.
class AppBrandColors {
  const AppBrandColors._();

  /// Primary brand color - Purple (#6B39F4)
  final Color purple = const Color(0xFF6B39F4);
}

/// Helper class for 'Icons' colors.
/// Provides colors for different icon states and types.
class AppIconColors {
  const AppIconColors._();

  /// Star icon color - Gold/Yellow (#F4B400)
  final Color star = const Color(0xFFF4B400);

  /// Standard icon color - Dark Purple (#251455)
  final Color icon = const Color(0xFF251455);

  /// Liked icon color - Light Pink/Red (#F4C4C4)
  final Color liked = const Color(0xFFF4C4C4);
}

/// Helper class for 'Priority' colors.
/// Provides background and text colors for high, medium, and low priorities.
class AppPriorityColors {
  const AppPriorityColors._();

  /// High priority colors
  final AppPriorityHighColors high = const AppPriorityHighColors._();

  /// Medium priority colors
  final AppPriorityMediumColors medium = const AppPriorityMediumColors._();

  /// Low priority colors
  final AppPriorityLowColors low = const AppPriorityLowColors._();
}

/// Helper class for 'High Priority' colors.
class AppPriorityHighColors {
  const AppPriorityHighColors._();

  /// High priority background - Light Pink (#FFC9DA)
  final Color bg = const Color(0xFFFFC9DA);

  /// High priority text - Red (#CD2C37)
  final Color text = const Color(0xFFCD2C37);
}

/// Helper class for 'Medium Priority' colors.
class AppPriorityMediumColors {
  const AppPriorityMediumColors._();

  /// Medium priority background - Light Yellow (#FEF9C2)
  final Color bg = const Color(0xFFFEF9C2);

  /// Medium priority text - Gold/Orange (#CB8605)
  final Color text = const Color(0xFFCB8605);
}

/// Helper class for 'Low Priority' colors.
class AppPriorityLowColors {
  const AppPriorityLowColors._();

  /// Low priority background - Light Gray (#EEEEEF)
  final Color bg = const Color(0xFFEEEEEF);

  /// Low priority text - Purple (#7464A1)
  final Color text = const Color(0xFF7464A1);
}

/// Helper class for 'States' colors.
/// Provides colors for UI states like disabled, error, and success.
class AppStatesColors {
  const AppStatesColors._();

  /// Disabled state - Very Light Gray (#F8F8F8)
  final Color disabled = const Color(0xFFF8F8F8);

  /// Error state - Red (#D4332C)
  final Color error = const Color(0xFFD4332C);

  /// Success state - Green (#34A745)
  final Color success = const Color(0xFF34A745);
}
