import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';

class TaskCardInfoRow extends StatelessWidget {
  final String location;
  final String duration;
  final int points;

  const TaskCardInfoRow({
    super.key,
    required this.location,
    required this.duration,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Location
        SvgPicture.asset(
          MyIcons.locationSolid,
          width: 18.w,
          height: 18.w,
          colorFilter: ColorFilter.mode(MyColors.brand.purple, BlendMode.srcIn),
        ),
        const HorizontalSpace(4),
        Flexible(
          child: Text(
            location,
            style: MyTextStyles.label.label1.copyWith(
              color: MyColors.text.primary,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const HorizontalSpace(12),

        // Duration
        SvgPicture.asset(
          MyIcons.progress,
          width: 18.w,
          height: 18.w,
          colorFilter: ColorFilter.mode(MyColors.brand.purple, BlendMode.srcIn),
        ),
        const HorizontalSpace(4),
        Text(
          duration,
          style: MyTextStyles.label.label1.copyWith(
            color: MyColors.text.primary,
          ),
        ),
        const HorizontalSpace(12),

        // Points
        SvgPicture.asset(
          MyIcons.pointsSolid,
          width: 18.w,
          height: 18.w,
          colorFilter: ColorFilter.mode(MyColors.brand.purple, BlendMode.srcIn),
        ),
        const HorizontalSpace(4),
        Text(
          '$points points',
          style: MyTextStyles.label.label1.copyWith(
            color: MyColors.text.primary,
          ),
        ),
      ],
    );
  }
}
