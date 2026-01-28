import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';


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
      child: Container(
         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: MyColors.background.secondary,
        borderRadius: BorderRadius.circular(24.r),
      ),
        
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: const BoxDecoration(
                color: Color(0XFFF9F5FF),
                shape: BoxShape.circle,
              ),
              child: Container(
                padding: EdgeInsets.all(10.r),
              decoration: const BoxDecoration(
                color: Color(0XFFF4EBFF),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset('assets/svg/Logout.svg'),
              
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
                      padding: EdgeInsets.symmetric(vertical: 8.h),
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
                      padding: EdgeInsets.symmetric(vertical: 8.h),
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
