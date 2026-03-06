import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/home/data/models/comment.dart';

class CommentTile extends StatelessWidget {
  final Comment comment;
  final bool isNested;
  final VoidCallback? onReplyTap;
  final VoidCallback? onDeleteTap;
  final VoidCallback? onEditTap;

  const CommentTile({
    super.key,
    required this.comment,
    this.isNested = false,
    this.onReplyTap,
    this.onDeleteTap,
    this.onEditTap,
  });

  void _showOptionsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: MyColors.background.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (onEditTap != null)
                ListTile(
                  leading: Icon(
                    Icons.edit_outlined,
                    size: 22.w,
                    color: MyColors.text.primary,
                  ),
                  title: Text(
                    'Edit',
                    style: MyTextStyles.body.body1.copyWith(
                      color: MyColors.text.primary,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    onEditTap!();
                  },
                ),
              if (onDeleteTap != null)
                ListTile(
                  leading: SvgPicture.asset(
                    MyIcons.trashStroke,
                    width: 22.w,
                    height: 22.h,
                    colorFilter: ColorFilter.mode(
                      MyColors.status.cancelled,
                      BlendMode.srcIn,
                    ),
                  ),
                  title: Text(
                    'Delete',
                    style: MyTextStyles.body.body1.copyWith(
                      color: MyColors.status.cancelled,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    onDeleteTap!();
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: isNested ? 48.w : 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundImage: comment.userAvatar != null
                ? NetworkImage(comment.userAvatar!)
                : null,
            backgroundColor: MyColors.background.secondary,
            child: comment.userAvatar == null
                ? Icon(Icons.person, size: 20.r, color: MyColors.icons.icon)
                : null,
          ),
          const HorizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            comment.userName,
                            style: MyTextStyles.body.body2.copyWith(
                              color: MyColors.text.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const HorizontalSpace(8),
                          Text(
                            comment.timeAgo,
                            style: MyTextStyles.caption.captionNotes.copyWith(
                              color: MyColors.text.secondary,
                            ),
                          ),
                          if (comment.location != null) ...[
                            Text(
                              ' • ',
                              style: MyTextStyles.caption.captionNotes.copyWith(
                                color: MyColors.text.secondary,
                              ),
                            ),
                            Text(
                              comment.location!,
                              style: MyTextStyles.caption.captionNotes.copyWith(
                                color: MyColors.text.secondary,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (onDeleteTap != null || onEditTap != null)
                          ? () => _showOptionsBottomSheet(context)
                          : null,
                      child: SvgPicture.asset(
                        MyIcons.moreVertical,
                        width: 20.w,
                        height: 20.h,
                        colorFilter: ColorFilter.mode(
                          MyColors.icons.icon,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
                const VerticalSpace(8),
                Text(
                  comment.content,
                  style: MyTextStyles.body.body2.copyWith(
                    color: MyColors.text.primary,
                  ),
                ),
                const VerticalSpace(12),
                Row(
                  children: [
                    GestureDetector(
                      onTap: onReplyTap,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            MyIcons.chatStroke,
                            width: 16.w,
                            height: 16.h,
                            colorFilter: ColorFilter.mode(
                              MyColors.text.secondary,
                              BlendMode.srcIn,
                            ),
                          ),
                          const HorizontalSpace(4),
                          Text(
                            'Reply',
                            style: MyTextStyles.caption.captionNotes.copyWith(
                              color: MyColors.text.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
