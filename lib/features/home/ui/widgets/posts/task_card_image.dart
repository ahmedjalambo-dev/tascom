import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';

class TaskCardImage extends StatelessWidget {
  final String imageUrl;

  const TaskCardImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Image.network(
        imageUrl,
        width: double.infinity,
        height: 180.h,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: double.infinity,
            height: 180.h,
            decoration: BoxDecoration(
              color: MyColors.background.secondary,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: double.infinity,
            height: 180.h,
            decoration: BoxDecoration(
              color: MyColors.background.secondary,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.image_outlined,
              size: 48.w,
              color: MyColors.text.third,
            ),
          );
        },
      ),
    );
  }
}
