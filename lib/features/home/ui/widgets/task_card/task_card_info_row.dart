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
          MyIcons.locationStroke,
          width: 16.w,
          height: 16.w,
          colorFilter: ColorFilter.mode(
            MyColors.text.secondary,
            BlendMode.srcIn,
          ),
        ),
        const HorizontalSpace(4),
        Flexible(
          child: Text(
            location,
            style: MyTextStyles.label.label1.copyWith(
              color: MyColors.text.secondary,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const HorizontalSpace(12),

        // Duration
        SvgPicture.asset(
          MyIcons.progress,
          width: 16.w,
          height: 16.w,
          colorFilter: ColorFilter.mode(
            MyColors.text.secondary,
            BlendMode.srcIn,
          ),
        ),
        const HorizontalSpace(4),
        Text(
          duration,
          style: MyTextStyles.label.label1.copyWith(
            color: MyColors.text.secondary,
          ),
        ),
        const HorizontalSpace(12),

        // Points
        SvgPicture.asset(
          MyIcons.pointsSolid,
          width: 16.w,
          height: 16.w,
          colorFilter: ColorFilter.mode(MyColors.brand.purple, BlendMode.srcIn),
        ),
        const HorizontalSpace(4),
        Text(
          '$points points',
          style: MyTextStyles.label.label1.copyWith(
            color: MyColors.brand.purple,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
