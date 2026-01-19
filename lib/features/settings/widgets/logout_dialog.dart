import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/themes/my_colors.dart';
import '../../../core/themes/my_text_style.dart';

class LogoutDialog extends StatelessWidget {
  final VoidCallback onLogout;

  const LogoutDialog({
    super.key,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
      backgroundColor: MyColors.background.secondary,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64.w,
              height: 64.h,
              decoration: BoxDecoration(
                color: MyColors.background.cardHover,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.logout,
                color: MyColors.brand.purple,
                size: 28.sp,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Logout of Tascom?",
              style: MyTextStyle.heading.h32.copyWith(
                fontWeight: FontWeight.w600,
                color: MyColors.text.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Are you sure you want to logout?\nYou will need to sign in again to\naccess your account and tasks.",
              textAlign: TextAlign.center,
              style: MyTextStyle.body.body2.copyWith(
                color: MyColors.text.secondary,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      side: BorderSide(color: MyColors.border.border),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
                    ),
                    child: Text(
                      "Cancel",
                      style: MyTextStyle.button.secondaryButton2.copyWith(
                        color: MyColors.text.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onLogout();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.brand.purple,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
                    ),
                    child: Text(
                      "Logout",
                      style: MyTextStyle.button.secondaryButton2.copyWith(
                        color: MyColors.text.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
