import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';

class MyImagePicker extends StatelessWidget {
  const MyImagePicker({
    super.key,
    this.selectedImage,
    required this.onPickImage,
    required this.onRemoveImage,
    this.placeholderText = 'Upload Image',
    this.placeholderIcon,
    this.previewHeight,
  });

  final File? selectedImage;
  final VoidCallback onPickImage;
  final VoidCallback onRemoveImage;
  final String placeholderText;
  final String? placeholderIcon;
  final double? previewHeight;

  @override
  Widget build(BuildContext context) {
    if (selectedImage != null) {
      return _buildImagePreview();
    }
    return _buildUploadButton();
  }

  Widget _buildImagePreview() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.file(
            selectedImage!,
            width: double.infinity,
            height: previewHeight ?? 150.h,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 8.h,
          right: 8.w,
          child: GestureDetector(
            onTap: onRemoveImage,
            child: Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.close, color: Colors.white, size: 20.w),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUploadButton() {
    return InkWell(
      onTap: onPickImage,
      borderRadius: BorderRadius.circular(40.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: MyColors.background.secondary,
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              placeholderIcon ?? MyIcons.uploadImageStroke,
              width: 20.w,
              height: 20.h,
              colorFilter: ColorFilter.mode(
                MyColors.text.primary,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              placeholderText,
              style: MyTextStyles.button.secondaryButton2.copyWith(
                color: MyColors.text.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
