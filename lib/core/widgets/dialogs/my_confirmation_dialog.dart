import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_button.dart';
import 'package:tascom/core/widgets/my_outlined_button.dart';
import 'package:tascom/core/widgets/my_spacing.dart';

/// Shows a generic confirmation dialog.
/// Returns `true` if the user confirms, `false` if canceled, or `null` if dismissed.
Future<bool?> showMyConfirmationDialog(
  BuildContext context, {
  required String iconPath,
  required String title,
  required String description,
  String cancelText = 'Cancel',
  String confirmText = 'Confirm',
  Color? iconColor,
  Color? iconBackgroundColor,
  Color? confirmButtonColor,
  bool barrierDismissible = true,
}) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) => MyConfirmationDialog(
      iconPath: iconPath,
      title: title,
      description: description,
      cancelText: cancelText,
      confirmText: confirmText,
      iconColor: iconColor,
      iconBackgroundColor: iconBackgroundColor,
      confirmButtonColor: confirmButtonColor,
    ),
  );
}

/// A generic confirmation dialog widget that can be customized for various use cases.
class MyConfirmationDialog extends StatelessWidget {
  const MyConfirmationDialog({
    super.key,
    required this.iconPath,
    required this.title,
    required this.description,
    this.cancelText = 'Cancel',
    this.confirmText = 'Confirm',
    this.iconColor,
    this.iconBackgroundColor,
    this.confirmButtonColor,
  });

  final String iconPath;
  final String title;
  final String description;
  final String cancelText;
  final String confirmText;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final Color? confirmButtonColor;

  @override
  Widget build(BuildContext context) {
    final effectiveIconColor = iconColor ?? MyColors.brand.purple;
    final effectiveIconBgColor =
        iconBackgroundColor ?? MyColors.brand.purple.withValues(alpha: 0.1);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
      backgroundColor: MyColors.background.primary,
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon Circle
            Container(
              width: 62.w,
              height: 62.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: effectiveIconBgColor,
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath,
                  width: 32.w,
                  height: 32.w,
                  colorFilter: ColorFilter.mode(
                    effectiveIconColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            const VerticalSpace(24),

            // Title
            Text(
              title,
              style: MyTextStyles.heading.h32.copyWith(
                color: MyColors.text.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const VerticalSpace(12),

            // Description
            Text(
              description,
              style: MyTextStyles.body.body1.copyWith(
                color: MyColors.text.secondary,
              ),
              textAlign: TextAlign.center,
            ),
            const VerticalSpace(24),

            // Buttons Row
            Row(
              children: [
                // Cancel Button (Outlined)
                Expanded(
                  child: MyOutlinedButton(
                    text: cancelText,
                    onPressed: () => Navigator.pop(context, false),
                  ),
                ),
                const HorizontalSpace(12),
                // Confirm Button (Filled)
                Expanded(
                  child: MyButton(
                    text: confirmText,
                    backgroundColor: confirmButtonColor,
                    onPressed: () => Navigator.pop(context, true),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
