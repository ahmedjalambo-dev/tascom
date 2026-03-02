import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/search/data/models/search_person_data.dart';

class PeopleCard extends StatelessWidget {
  final SearchPersonData person;

  const PeopleCard({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: MyColors.background.primary,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: MyColors.border.postBorder, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAvatar(),
          const HorizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNameAndRating(),
                if (person.location != null && person.location!.isNotEmpty) ...[
                  const VerticalSpace(4),
                  _buildLocation(),
                ],
                if (person.skills != null && person.skills!.isNotEmpty) ...[
                  const VerticalSpace(8),
                  _buildSkills(),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      radius: 24.r,
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
        if (person.ratingAvg != null) ...[
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
    return Row(
      children: [
        Icon(
          Icons.location_on_outlined,
          size: 14.w,
          color: MyColors.text.third,
        ),
        SizedBox(width: 4.w),
        Expanded(
          child: Text(
            person.location!,
            style: MyTextStyles.label.label2.copyWith(
              color: MyColors.text.third,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildSkills() {
    final skillList = person.skills!
        .split(',')
        .map((s) => s.trim())
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
