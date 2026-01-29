import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/home/data/models/task_post.dart';

class TaskCardHeader extends StatelessWidget {
  final TaskPost taskPost;

  const TaskCardHeader({super.key, required this.taskPost});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // User Avatar
        CircleAvatar(
          radius: 20.r,
          backgroundColor: MyColors.background.secondary,
          backgroundImage: taskPost.userAvatar != null
              ? AssetImage(taskPost.userAvatar!)
              : null,
          child: taskPost.userAvatar == null
              ? Text(
                  taskPost.userName[0].toUpperCase(),
                  style: MyTextStyles.body.body1.copyWith(
                    color: MyColors.brand.purple,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : null,
        ),
        const HorizontalSpace(12),

        // User Info (Name + Rating)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    taskPost.userName,
                    style: MyTextStyles.body.body2.copyWith(
                      color: MyColors.text.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const HorizontalSpace(8),
                  SvgPicture.asset(
                    MyIcons.starSolid,
                    width: 14.w,
                    height: 14.w,
                    colorFilter: ColorFilter.mode(
                      MyColors.icons.star,
                      BlendMode.srcIn,
                    ),
                  ),
                  const HorizontalSpace(4),
                  Text(
                    taskPost.userRating.toString(),
                    style: MyTextStyles.label.label1.copyWith(
                      color: MyColors.text.secondary,
                    ),
                  ),
                ],
              ),
              Text(
                taskPost.timeAgo,
                style: MyTextStyles.label.label2.copyWith(
                  color: MyColors.text.third,
                ),
              ),
            ],
          ),
        ),

        // Bookmark Icon
        GestureDetector(
          onTap: () {
            // Handle bookmark
          },
          child: SvgPicture.asset(
            MyIcons.saveStroke,
            width: 24.w,
            height: 24.w,
            colorFilter: ColorFilter.mode(
              MyColors.text.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
        const HorizontalSpace(8),

        // More Options Icon
        GestureDetector(
          onTap: () {
            // Handle more options
          },
          child: Icon(
            Icons.more_vert,
            size: 24.w,
            color: MyColors.text.primary,
          ),
        ),
      ],
    );
  }
}
