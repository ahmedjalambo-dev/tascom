import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/home/data/models/task_post.dart';
import 'package:tascom/features/home/ui/widgets/task_card/task_card_actions.dart';
import 'package:tascom/features/home/ui/widgets/task_card/task_card_chips.dart';
import 'package:tascom/features/home/ui/widgets/task_card/task_card_header.dart';
import 'package:tascom/features/home/ui/widgets/task_card/task_card_image.dart';
import 'package:tascom/features/home/ui/widgets/task_card/task_card_info_row.dart';

class TaskCard extends StatelessWidget {
  final TaskPost taskPost;
  final VoidCallback? onTap;
  final VoidCallback? onLikeTap;
  final VoidCallback? onCommentTap;
  final VoidCallback? onShareTap;
  final VoidCallback? onClaimTap;

  const TaskCard({
    super.key,
    required this.taskPost,
    this.onTap,
    this.onLikeTap,
    this.onCommentTap,
    this.onShareTap,
    this.onClaimTap,
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
              TaskCardHeader(taskPost: taskPost),
              const VerticalSpace(12),

              // Title
              Text(
                taskPost.title,
                style: MyTextStyles.body.body1.copyWith(
                  color: MyColors.text.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const VerticalSpace(8),

              // Description
              Text(
                taskPost.description,
                style: MyTextStyles.body.body2.copyWith(
                  color: MyColors.text.secondary,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              const VerticalSpace(12),

              // Category and Priority Chips
              TaskCardChips(
                category: taskPost.category,
                priority: taskPost.priority,
              ),
              const VerticalSpace(12),

              // Info Row: Location, Duration, Points
              TaskCardInfoRow(
                location: taskPost.location,
                duration: taskPost.duration,
                points: taskPost.points,
              ),

              // Optional Image
              if (taskPost.imageUrl != null) ...[
                const VerticalSpace(12),
                TaskCardImage(imageUrl: taskPost.imageUrl!),
              ],

              const VerticalSpace(12),

              // Actions: Like, Comment, Share, Claim Button
              TaskCardActions(
                likeCount: taskPost.likeCount,
                commentCount: taskPost.commentCount,
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
