import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';

class ProfileImagePicker extends StatelessWidget {
  const ProfileImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50.r,
            backgroundImage: const NetworkImage(
              'https://i.pravatar.cc/300', // Placeholder image similar to screenshot
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 32.h,
              width: 32.w,
              decoration: BoxDecoration(
                color: MyColors.brand.purple,
                shape: BoxShape.circle,
                border: Border.all(color: MyColors.text.white, width: 2.w),
              ),
              child: Icon(
                Icons.edit,
                color: MyColors.text.white,
                size: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
