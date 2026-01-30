import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_button.dart';
import 'package:tascom/core/widgets/my_outlined_button.dart';
import 'package:tascom/core/widgets/my_spacing.dart';

/// Shows a confirmation dialog for claiming a task.
/// Returns `true` if the user accepts, `false` if ignored, or `null` if dismissed.
Future<bool?> showClaimConfirmationDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder: (context) => const ClaimConfirmationDialog(),
  );
}

class ClaimConfirmationDialog extends StatelessWidget {
  const ClaimConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
      backgroundColor: MyColors.background.primary,
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Checkmark Icon Circle
            Container(
              width: 62.w,
              height: 62.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.brand.purple.withValues(alpha: 0.1),
              ),
              child: Center(
                child: SvgPicture.asset(
                  MyIcons.trueSolid,
                  width: 40.w,
                  height: 40.w,
                  colorFilter: ColorFilter.mode(
                    MyColors.brand.purple,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            const VerticalSpace(24),

            // Title
            Text(
              'Confirm Task Claim',
              style: MyTextStyles.heading.h32.copyWith(
                color: MyColors.text.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const VerticalSpace(12),

            // Description
            Text(
              'Are you sure you want to claim this task?\nOnce confirmed, the task will be assigned to you.',
              style: MyTextStyles.body.body1.copyWith(
                color: MyColors.text.secondary,
              ),
              textAlign: TextAlign.center,
            ),
            const VerticalSpace(24),

            // Buttons Row
            Row(
              children: [
                // Ignore Button (Outlined)
                Expanded(
                  child: MyOutlinedButton(
                    text: 'Ignore',
                    onPressed: () => Navigator.pop(context, false),
                  ),
                ),
                const HorizontalSpace(12),
                // Accept Button (Filled)
                Expanded(
                  child: MyButton(
                    text: 'Accept',
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
