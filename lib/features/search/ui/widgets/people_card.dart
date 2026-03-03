import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/search/data/models/search_person_data.dart';

class PeopleCard extends StatelessWidget {
  final SearchPersonData person;
  final String? resolvedLocation;
  final VoidCallback? onTap;

  const PeopleCard({
    super.key,
    required this.person,
    this.resolvedLocation,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: MyColors.background.primary,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: MyColors.border.postBorder, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAvatar(),
              const HorizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNameAndRating(),
                    const VerticalSpace(4),
                    _buildLocation(),
                  ],
                ),
              ),
              _buildMessageButton(),
            ],
          ),
          if (person.skills != null && person.skills!.isNotEmpty) ...[
            const VerticalSpace(12),
            _buildSkills(),
          ],
        ],
      ),
      ),
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      radius: 30.r,
      backgroundColor: MyColors.brand.purple.withValues(alpha: 0.1),
      backgroundImage: person.avatar != null
          ? NetworkImage(person.avatar!)
          : null,
      child: person.avatar == null
          ? Text(
              person.name.isNotEmpty ? person.name[0].toUpperCase() : '?',
              style: MyTextStyles.heading.h22.copyWith(
                color: MyColors.brand.purple,
              ),
            )
          : null,
    );
  }

  Widget _buildNameAndRating() {
    return Row(
      children: [
        Expanded(
          child: Text(
            person.name,
            style: MyTextStyles.heading.h32.copyWith(
              color: MyColors.text.primary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (person.ratingAvg != null && person.ratingAvg! > 0) ...[
          Icon(Icons.star_rounded, color: MyColors.icons.star, size: 16.w),
          SizedBox(width: 2.w),
          Text(
            person.ratingAvg!.toStringAsFixed(1),
            style: MyTextStyles.label.label2.copyWith(
              color: MyColors.text.secondary,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildLocation() {
    final displayLocation = resolvedLocation;
    final distanceText = person.distance > 0
        ? '${person.distance.toStringAsFixed(1)} km'
        : null;

    if ((displayLocation == null || displayLocation.isEmpty) &&
        distanceText == null) {
      return const SizedBox.shrink();
    }

    final parts = <String>[];
    if (displayLocation != null && displayLocation.isNotEmpty) {
      parts.add(displayLocation);
    }
    if (distanceText != null) {
      parts.add(distanceText);
    }

    return Row(
      children: [
        Icon(
          Icons.location_on_outlined,
          size: 14.w,
          color: MyColors.brand.purple,
        ),
        SizedBox(width: 4.w),
        Expanded(
          child: Text(
            parts.join(' \u2022 '),
            style: MyTextStyles.label.label2.copyWith(
              color: MyColors.brand.purple,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildMessageButton() {
    return GestureDetector(
      onTap: () {
        // Placeholder for future chat/message navigation
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: MyColors.brand.purple,
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: SvgPicture.asset(
          MyIcons.sendSolid,
          width: 16.w,
          height: 16.h,
          colorFilter: ColorFilter.mode(
            MyColors.background.primary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  Widget _buildSkills() {
    final skillList = person.skills!
        .split(',')
        .map((s) => s.trim().replaceAll(RegExp(r'[\[\]"]'), '').trim())
        .where((s) => s.isNotEmpty)
        .toList();
    return Wrap(
      spacing: 6.w,
      runSpacing: 6.h,
      children: skillList.map((skill) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: MyColors.brand.purple.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Text(
            skill,
            style: MyTextStyles.caption.captionNotes.copyWith(
              color: MyColors.brand.purple,
            ),
          ),
        );
      }).toList(),
    );
  }
}
