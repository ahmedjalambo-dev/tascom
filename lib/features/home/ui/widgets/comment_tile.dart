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

  const CommentTile({
    super.key,
    required this.comment,
    this.isNested = false,
    this.onReplyTap,
  });

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
                ? Icon(
                    Icons.person,
                    size: 20.r,
                    color: MyColors.icons.icon,
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
                    SvgPicture.asset(
                      MyIcons.moreVertical,
                      width: 20.w,
                      height: 20.h,
                      colorFilter: ColorFilter.mode(
                        MyColors.icons.icon,
                        BlendMode.srcIn,
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
                    SvgPicture.asset(
                      MyIcons.sendStroke,
                      width: 20.w,
                      height: 20.h,
                      colorFilter: ColorFilter.mode(
                        MyColors.text.secondary,
                        BlendMode.srcIn,
                      ),
                    ),
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
