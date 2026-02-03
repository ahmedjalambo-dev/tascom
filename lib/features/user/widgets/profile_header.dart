import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String? avatarUrl;
  final double rating;
  final int reviewCount;

  const ProfileHeader({
    super.key,
    required this.name,
    this.avatarUrl,
    required this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 64.h,
          width: 64.w,
          child: CircleAvatar(
            radius: 50.r,
            backgroundColor: MyColors.background.cardHover,
            backgroundImage: avatarUrl != null
                ? NetworkImage(avatarUrl!)
                : null,
            child: avatarUrl == null
                ? Text(
                    name.isNotEmpty ? name[0].toUpperCase() : '?',
                    style: MyTextStyles.heading.h1.copyWith(
                      color: MyColors.brand.purple,
                    ),
                  )
                : null,
          ),
        ),
        const VerticalSpace(12),
        Text(
          name,
          style: MyTextStyles.heading.h32.copyWith(
            color: MyColors.text.primary,
          ),
        ),
        const VerticalSpace(8),
        _buildRatingBadge(),
      ],
    );
  }

  Widget _buildRatingBadge() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: MyColors.background.primary,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: MyColors.border.postBorder, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            MyIcons.starSolid,
            width: 16.w,
            height: 16.h,
            colorFilter: ColorFilter.mode(MyColors.icons.star, BlendMode.srcIn),
          ),
          const HorizontalSpace(4),
          Text(
            '$rating ($reviewCount reviews)',
            style: MyTextStyles.label.label1.copyWith(
              color: MyColors.text.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
