import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.primary,
      appBar: AppBar(
        backgroundColor: MyColors.background.secondary,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: MyColors.text.primary,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Add Post',
          style: MyTextStyle.heading.h32.copyWith(
            color: MyColors.text.primary,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle_outline,
                size: 64.sp,
                color: MyColors.brand.purple,
              ),
              SizedBox(height: 16.h),
              Text(
                'Create New Post',
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
