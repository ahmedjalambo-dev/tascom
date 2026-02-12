import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/home/data/models/comment.dart';
import 'package:tascom/features/home/ui/widgets/comments/comment_tile.dart';

class CommentsSection extends StatelessWidget {
  final List<Comment> comments;
  final int totalCount;
  final VoidCallback? onFilterTap;

  const CommentsSection({
    super.key,
    required this.comments,
    required this.totalCount,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Comments ($totalCount)',
              style: MyTextStyles.heading.h22.copyWith(
                color: MyColors.text.primary,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: onFilterTap,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  border: Border.all(color: MyColors.border.border),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'All',
                      style: MyTextStyles.body.body2.copyWith(
                        color: MyColors.text.primary,
                      ),
                    ),
                    const HorizontalSpace(4),
                    SvgPicture.asset(
                      MyIcons.arrowDown,
                      width: 16.w,
                      height: 16.h,
                      colorFilter: ColorFilter.mode(
                        MyColors.icons.icon,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const VerticalSpace(16),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: comments.length,
          separatorBuilder: (context, index) => const VerticalSpace(16),
          itemBuilder: (context, index) {
            final comment = comments[index];
            return Column(
              children: [
                CommentTile(comment: comment),
                if (comment.replies.isNotEmpty) ...[
                  const VerticalSpace(16),
                  ...comment.replies.map(
                    (reply) => Padding(
                      padding: EdgeInsets.only(
                        bottom: comment.replies.last != reply ? 16.h : 0,
                      ),
                      child: CommentTile(comment: reply, isNested: true),
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ],
    );
  }
}
