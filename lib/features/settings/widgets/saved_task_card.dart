import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/themes/my_colors.dart';
import '../../../core/themes/my_text_style.dart';

class SavedTaskCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String points;
  final String description;

  const SavedTaskCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.points,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.background.secondary,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
        border: Border.all(color: MyColors.border.postBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              imagePath,
              height: 120.h, // Adjust height as needed
              width: double.infinity,
              fit: BoxFit.cover,
           
            ),
          ),
          
          // Content Section
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: MyTextStyle.body.body2.copyWith(
                          fontWeight: FontWeight.bold,
                          color: MyColors.text.primary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(Icons.bookmark, color: MyColors.brand.purple, size: 24.sp),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    SvgPicture.asset('assets/svg/zap.svg'),
                    const SizedBox(width: 4),
                    Text(
                      points,
                      style: MyTextStyle.label.label1.copyWith(
                        color: MyColors.brand.purple,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: MyTextStyle.label.label2.copyWith(
                    color: MyColors.text.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
