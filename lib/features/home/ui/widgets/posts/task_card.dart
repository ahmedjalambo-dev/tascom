import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/home/data/models/task_model.dart';
import 'package:tascom/features/home/ui/widgets/posts/task_card_actions.dart';
import 'package:tascom/features/home/ui/widgets/posts/task_card_chips.dart';
import 'package:tascom/features/home/ui/widgets/posts/task_card_header.dart';
import 'package:tascom/features/home/ui/widgets/posts/task_card_image.dart';
import 'package:tascom/features/home/ui/widgets/posts/task_card_info_row.dart';

class TaskCard extends StatelessWidget {
  final TaskModel taskModel;
  final VoidCallback? onTap;
  final VoidCallback? onLikeTap;
  final VoidCallback? onCommentTap;
  final VoidCallback? onShareTap;
  final VoidCallback? onClaimTap;
  final VoidCallback? onSaveTap;
  final bool isClaimLoading;
  final int? maxLines;

  const TaskCard({
    super.key,
    required this.taskModel,
    this.onTap,
    this.onLikeTap,
    this.onCommentTap,
    this.onShareTap,
    this.onClaimTap,
    this.onSaveTap,
    this.isClaimLoading = false,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
              // Header: Avatar, Name, Rating, Bookmark, Menu
              TaskCardHeader(taskModel: taskModel, onSaveTap: onSaveTap),
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
                maxLines: maxLines,
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

              const VerticalSpace(12),

              // Actions: Like, Comment, Share, Claim Button
              TaskCardActions(
                likeCount: taskModel.likeCount,

                isLiked: taskModel.isLiked,
                isClaimed: taskModel.isClaimed,
                isClaimLoading: isClaimLoading,
                onLikeTap: onLikeTap,
                onCommentTap: onCommentTap,
                onShareTap: onShareTap,
                onClaimTap: onClaimTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
