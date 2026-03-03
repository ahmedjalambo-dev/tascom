import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/helpers/time_helper.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/settings/requests/data/models/task_claim_group_model.dart';

class TaskClaimHeaderCard extends StatelessWidget {
  final TaskClaimGroupModel taskGroup;

  const TaskClaimHeaderCard({super.key, required this.taskGroup});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          taskGroup.taskTitle,
          style: MyTextStyles.heading.h32.copyWith(
            color: MyColors.text.primary,
          ),
        ),
        const VerticalSpace(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Posted ${calculateTimeAgo(taskGroup.taskPostedAt)}',
              style: MyTextStyles.body.body2.copyWith(
                color: MyColors.text.secondary,
              ),
            ),
            Row(
              children: [
                SvgPicture.asset(
                  MyIcons.pointsSolid,
                  width: 20.w,
                  height: 20.h,
                  colorFilter: ColorFilter.mode(
                    MyColors.brand.purple,
                    BlendMode.srcIn,
                  ),
                ),
                const HorizontalSpace(4),
                Text(
                  '${taskGroup.taskPoints} pts',
                  style: MyTextStyles.body.body2.copyWith(
                    color: MyColors.brand.purple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
