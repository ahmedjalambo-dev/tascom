import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/core/widgets/spacing_widgets.dart';
import 'package:tascom/features/home/data/models/task_model.dart';
import 'priority_badge.dart';
import 'category_tag.dart';

/// A card widget that displays a task/post in the home feed.
class TaskCard extends StatelessWidget {
  final TaskModel task;
  final VoidCallback? onLikeTap;
  final VoidCallback? onBookmarkTap;
  final VoidCallback? onClaimTap;
  final VoidCallback? onTap;

  const TaskCard({
    super.key,
    required this.task,
    this.onLikeTap,
    this.onBookmarkTap,
    this.onClaimTap,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: MyColors.background.secondary,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: MyColors.border.postBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 12.h),
            _buildTitle(),
            SizedBox(height: 8.h),
            _buildDescription(),
            SizedBox(height: 12.h),
            _buildTags(),
            SizedBox(height: 12.h),
            _buildMetaInfo(),
            if (task.imageUrl != null) ...[
              SizedBox(height: 12.h),
              _buildImage(),
            ],
            SizedBox(height: 12.h),
            _buildActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        // Avatar
        CircleAvatar(
          radius: 20.r,
          backgroundColor: MyColors.background.cardHover,
          backgroundImage: task.authorAvatar != null
              ? NetworkImage(task.authorAvatar!)
              : null,
          child: task.authorAvatar == null
              ? Text(
                  task.authorName[0].toUpperCase(),
                  style: MyTextStyle.body.body1.copyWith(
                    color: MyColors.brand.purple,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : null,
        ),
        SizedBox(width: 10.w),
        // Name and time
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    task.authorName,
                    style: MyTextStyle.body.body2.copyWith(
                      fontWeight: FontWeight.w600,
                      color: MyColors.text.primary,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  SvgPicture.asset(
                    'assets/icons/post/stars.svg',
                    width: 14.sp,
                    height: 14.sp,
                    colorFilter: ColorFilter.mode(
                      MyColors.icons.star,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    task.authorRating.toString(),
                    style: MyTextStyle.label.label1.copyWith(
                      color: MyColors.text.secondary,
                    ),
                  ),
                ],
              ),
              Text(
                _getTimeAgo(),
                style: MyTextStyle.caption.captionNotes.copyWith(
                  color: MyColors.text.third,
                ),
              ),
            ],
          ),
        ),
        // Bookmark button
        GestureDetector(
          onTap: onBookmarkTap,
          child: SvgPicture.asset(
            task.isBookmarked
                ? 'assets/icons/post/saved-solid.svg'
                : 'assets/icons/post/saved.svg',
            width: 22.sp,
            height: 22.sp,
            colorFilter: ColorFilter.mode(
              task.isBookmarked ? MyColors.brand.purple : MyColors.icons.icon,
              BlendMode.srcIn,
            ),
          ),
        ),
        SizedBox(width: 8.w),
        // More button
        SvgPicture.asset(
          'assets/icons/post/more-vertical.svg',
          width: 22.sp,
          height: 22.sp,
          colorFilter: ColorFilter.mode(MyColors.icons.icon, BlendMode.srcIn),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      task.title,
      style: MyTextStyle.body.body1.copyWith(
        fontWeight: FontWeight.w600,
        color: MyColors.text.primary,
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      task.description,
      style: MyTextStyle.body.body2.copyWith(
        color: MyColors.text.secondary,
        height: 1.4,
      ),
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildTags() {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: [
        CategoryTag(label: task.category, color: MyColors.brand.purple),
        PriorityBadge(priority: task.priority),
      ],
    );
  }

  Widget _buildMetaInfo() {
    return Row(
      children: [
        // location
        SvgPicture.asset(
          'assets/icons/app-bar/location.svg',
          width: 18.sp,
          height: 18.sp,
          colorFilter: ColorFilter.mode(MyColors.brand.purple, BlendMode.srcIn),
        ),
        HorizontalSpace(4.w),
        Text(
          task.location,
          style: MyTextStyle.label.label2.copyWith(
            color: MyColors.text.secondary,
          ),
        ),
        HorizontalSpace(8.w),

        // duration
        SvgPicture.asset(
          'assets/icons/post/progress.svg',
          width: 18.sp,
          height: 18.sp,
          colorFilter: ColorFilter.mode(MyColors.brand.purple, BlendMode.srcIn),
        ),
        HorizontalSpace(4.w),
        Text(
          task.duration,
          style: MyTextStyle.label.label2.copyWith(
            color: MyColors.text.secondary,
          ),
        ),
        HorizontalSpace(8.w),

        // points
        SvgPicture.asset(
          'assets/icons/post/points.svg',
          width: 18.sp,
          height: 18.sp,
          colorFilter: ColorFilter.mode(MyColors.brand.purple, BlendMode.srcIn),
        ),
        HorizontalSpace(4.w),
        Text(
          '${task.points} points',
          style: MyTextStyle.label.label2.copyWith(
            color: MyColors.text.secondary,
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Image.network(
        task.imageUrl!,
        height: 160.h,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 160.h,
            width: double.infinity,
            color: MyColors.background.cardHover,
            child: Icon(
              Icons.image_outlined,
              size: 48.sp,
              color: MyColors.text.third,
            ),
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            height: 160.h,
            width: double.infinity,
            color: MyColors.background.cardHover,
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                    : null,
                color: MyColors.brand.purple,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      children: [
        // Like button
        GestureDetector(
          onTap: onLikeTap,
          child: Row(
            children: [
              SvgPicture.asset(
                task.isLiked
                    ? 'assets/icons/post/like-solid.svg'
                    : 'assets/icons/post/like.svg',
                width: 20.sp,
                height: 20.sp,
                colorFilter: ColorFilter.mode(
                  task.isLiked ? Colors.red : MyColors.icons.icon,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                task.likesCount.toString(),
                style: MyTextStyle.label.label1.copyWith(
                  color: MyColors.text.secondary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 20.w),
        // Comment button
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/post/comment.svg',
              width: 20.sp,
              height: 20.sp,
              colorFilter: ColorFilter.mode(
                MyColors.icons.icon,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              task.commentsCount.toString(),
              style: MyTextStyle.label.label1.copyWith(
                color: MyColors.text.secondary,
              ),
            ),
          ],
        ),
        SizedBox(width: 20.w),
        // Share button
        SvgPicture.asset(
          'assets/icons/post/link-forward.svg',
          width: 20.sp,
          height: 20.sp,
          colorFilter: ColorFilter.mode(MyColors.icons.icon, BlendMode.srcIn),
        ),
        const Spacer(),
        // Claim Task button
        GestureDetector(
          onTap: onClaimTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: MyColors.brand.purple,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              'Claim Task',
              style: MyTextStyle.button.smallButtons.copyWith(
                color: MyColors.text.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _getTimeAgo() {
    final difference = DateTime.now().difference(task.createdAt);
    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  // IconData _getCategoryIcon(String category) {
  //   switch (category.toLowerCase()) {
  //     case 'home services':
  //       return Icons.home_outlined;
  //     case 'repairs':
  //       return Icons.build_outlined;
  //     case 'errands':
  //       return Icons.shopping_cart_outlined;
  //     case 'cleaning':
  //       return Icons.cleaning_services_outlined;
  //     case 'delivery':
  //       return Icons.local_shipping_outlined;
  //     default:
  //       return Icons.category_outlined;
  //   }
  // }
}
