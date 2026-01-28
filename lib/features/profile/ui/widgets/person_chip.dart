import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

/// A chip widget that displays a person's name with their avatar.
/// Used to show Helper or Poster information in task cards.
class PersonChip extends StatelessWidget {
  final String name;
  final String avatarUrl;
  final String label; // "Helper:" or "Poster:"

  const PersonChip({
    super.key,
    required this.name,
    required this.avatarUrl,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: MyColors.background.secondary,
        borderRadius: BorderRadius.circular(50.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 10.r,
            backgroundImage: NetworkImage(avatarUrl),
          ),
          SizedBox(width: 8.w),
          Text(
            "$label $name",
            style: MyTextStyle.label.label1.copyWith(
              color: MyColors.text.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
