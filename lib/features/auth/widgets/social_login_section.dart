import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/auth/widgets/social_login_button.dart';
import 'package:tascom/core/widgets/spacing_widgets.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({
    super.key,
    required this.onGoogleTap,
    required this.onFacebookTap,
    this.dividerText = 'Or continue with',
  });

  final VoidCallback onGoogleTap;
  final VoidCallback onFacebookTap;
  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          dividerText,
          style: MyTextStyle.body.body2.copyWith(
            color: MyColors.text.secondary,
          ),
        ),
        VerticalSpace(16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialLoginButton(
              iconPath: 'assets/icons/auth/google.svg',
              onTap: onGoogleTap,
            ),
            HorizontalSpace(16.w),
            SocialLoginButton(
              iconPath: 'assets/icons/auth/facebook.svg',
              onTap: onFacebookTap,
            ),
          ],
        ),
      ],
    );
  }
}
