import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';

class MyUserProfileRow extends StatelessWidget {
  const MyUserProfileRow({
    super.key,
    required this.name,
    required this.subtitle,
    this.avatarUrl,
    this.avatarRadius,
    this.onTap,
  });

  final String name;
  final String subtitle;
  final String? avatarUrl;
  final double? avatarRadius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final content = Row(
      children: [
        CircleAvatar(
          radius: avatarRadius ?? 24.r,
          backgroundColor: MyColors.border.border,
          backgroundImage:
              avatarUrl != null ? NetworkImage(avatarUrl!) : null,
          child: avatarUrl == null
              ? Icon(
                  Icons.person,
                  size: (avatarRadius ?? 24.r) * 1.2,
                  color: MyColors.text.secondary,
                )
              : null,
        ),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: MyTextStyles.body.body1.copyWith(
                color: MyColors.text.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              subtitle,
              style: MyTextStyles.body.body2.copyWith(
                color: MyColors.text.secondary,
              ),
            ),
          ],
        ),
      ],
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.r),
        child: content,
      );
    }

    return content;
  }
}
