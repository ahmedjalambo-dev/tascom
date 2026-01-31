import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/core/widgets/spacing_widgets.dart';
import 'package:tascom/features/home/data/models/task_model.dart';
import 'task_card.dart';

/// The posts section widget displaying a list of task cards.
class PostsSection extends StatelessWidget {
  final List<TaskModel> tasks;
  final String selectedFilter;
  final VoidCallback? onFilterTap;
  final void Function(int index)? onLikeTap;
  final void Function(int index)? onBookmarkTap;
  final void Function(int index)? onClaimTap;
  final void Function(int index)? onTaskTap;

  const PostsSection({
    super.key,
    required this.tasks,
    this.selectedFilter = 'All',
    this.onFilterTap,
    this.onLikeTap,
    this.onBookmarkTap,
    this.onClaimTap,
    this.onTaskTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Posts',
                style: MyTextStyle.heading.h22.copyWith(
                  color: MyColors.text.primary,
                ),
              ),
              GestureDetector(
                onTap: onFilterTap,
                child: Row(
                  children: [
                    Text(
                      selectedFilter,
                      style: MyTextStyle.body.body2.copyWith(
                        color: MyColors.text.secondary,
                      ),
                    ),
                    HorizontalSpace(4.w),
                    SvgPicture.asset(
                      'assets/icons/search/arrow-down.svg',
                      width: 16.sp,
                      height: 16.sp,
                      colorFilter: ColorFilter.mode(
                        MyColors.icons.icon,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Task list
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.only(bottom: 20.h),
            itemCount: tasks.length,
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemBuilder: (context, index) {
              return TaskCard(
                task: tasks[index],
                onLikeTap: () => onLikeTap?.call(index),
                onBookmarkTap: () => onBookmarkTap?.call(index),
                onClaimTap: () => onClaimTap?.call(index),
                onTap: () => onTaskTap?.call(index),
              );
            },
          ),
        ),
      ],
    );
  }
}
