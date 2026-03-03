import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/home/data/models/task_model.dart';
import 'package:tascom/features/home/ui/widgets/posts/task_card_chips.dart';
import 'package:tascom/features/home/ui/widgets/posts/task_card_image.dart';
import 'package:tascom/features/home/ui/widgets/posts/task_card_info_row.dart';

class SearchTaskCard extends StatelessWidget {
  final TaskModel taskModel;
  final VoidCallback? onTap;

  const SearchTaskCard({super.key, required this.taskModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: MyColors.background.primary,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: MyColors.border.postBorder, width: 1),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: Avatar, Name, Rating, Time — no bookmark/menu
              _buildHeader(),
              const VerticalSpace(12),

              // Title
              Text(
                taskModel.title,
                style: MyTextStyles.body.body1.copyWith(
                  color: MyColors.text.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const VerticalSpace(8),

              // Description
              Text(
                taskModel.description,
                style: MyTextStyles.body.body2.copyWith(
                  color: MyColors.text.secondary,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              const VerticalSpace(12),

              // Category and Priority Chips
              TaskCardChips(
                category: taskModel.category,
                priority: taskModel.priority,
              ),
              const VerticalSpace(12),

              // Info Row: Location, Duration, Points
              TaskCardInfoRow(
                location: taskModel.location.name,
                duration: taskModel.duration,
                points: taskModel.metrics.points,
              ),

              // Optional Image
              if (taskModel.imageUrl != null) ...[
                const VerticalSpace(12),
                TaskCardImage(imageUrl: taskModel.imageUrl!),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundColor: MyColors.background.secondary,
          backgroundImage: taskModel.author.avatar != null
              ? NetworkImage(taskModel.author.avatar!)
              : null,
          child: taskModel.author.avatar == null
              ? Text(
                  taskModel.author.name[0].toUpperCase(),
                  style: MyTextStyles.body.body1.copyWith(
                    color: MyColors.brand.purple,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : null,
        ),
        const HorizontalSpace(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    taskModel.author.name,
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
                    taskModel.author.rating.toString(),
                    style: MyTextStyles.label.label1.copyWith(
                      color: MyColors.text.secondary,
                    ),
                  ),
                ],
              ),
              Text(
                taskModel.timeAgo,
                style: MyTextStyles.label.label2.copyWith(
                  color: MyColors.text.third,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
