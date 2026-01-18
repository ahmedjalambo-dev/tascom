import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.primary,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person, size: 64.sp, color: MyColors.brand.purple),
              SizedBox(height: 16.h),
              Text(
                'Profile',
                style: MyTextStyle.heading.h21.copyWith(
                  color: MyColors.text.primary,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Coming soon',
                style: MyTextStyle.body.body1.copyWith(
                  color: MyColors.text.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
