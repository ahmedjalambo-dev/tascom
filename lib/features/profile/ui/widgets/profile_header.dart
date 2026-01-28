import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/core/widgets/spacing_widgets.dart';
import 'package:tascom/features/profile/data/profile_model.dart';
import 'package:tascom/features/profile/ui/widgets/rate_and_review.dart';

/// Widget that displays the user's profile header with avatar, name, and rating.
class ProfileHeader extends StatelessWidget {
  final ProfileModel profile;

  const ProfileHeader({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 48.r,
          backgroundImage: NetworkImage(profile.avatarUrl),
        ),
        VerticalSpace(8.h),
        Text(
          profile.name,
          style: MyTextStyle.heading.h32.copyWith(color: MyColors.text.primary),
        ),
        VerticalSpace(4.h),
        RateAndReviews(profile: profile),
      ],
    );
  }
}
