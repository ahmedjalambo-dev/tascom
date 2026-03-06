import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/my_icons.dart';
import '../../../core/themes/my_colors.dart';
import '../../../core/themes/my_text_styles.dart';
import '../../../core/widgets/my_text_field.dart';

class CommentInputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final bool isLoading;
  final String? replyingToName;
  final VoidCallback? onCancelReply;
  final bool isEditing;
  final VoidCallback? onCancelEdit;

  const CommentInputBar({
    super.key,
    required this.controller,
    required this.onSend,
    this.isLoading = false,
    this.replyingToName,
    this.onCancelReply,
    this.isEditing = false,
    this.onCancelEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: MyColors.background.primary,
        // border: Border(top: BorderSide(color: MyColors.border.border)),
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: MyColors.text.secondary.withAlpha(40),
            spreadRadius: 2,
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isEditing) _buildEditIndicator(),
            if (replyingToName != null && !isEditing) _buildReplyIndicator(),
            Row(
              children: [
                Expanded(
                  child: MyTextField(
                    controller: controller,
                    hintText: isEditing
                        ? 'Edit your comment...'
                        : replyingToName != null
                        ? 'Write a reply...'
                        : 'Write a comment...',
                  ),
                ),
                SizedBox(width: 8.w),
                IconButton(
                  onPressed: isLoading ? null : onSend,
                  icon: isLoading
                      ? SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: MyColors.brand.purple,
                          ),
                        )
                      : SvgPicture.asset(
                          MyIcons.sendSolid,
                          width: 24.w,
                          height: 24.h,
                          colorFilter: ColorFilter.mode(
                            MyColors.brand.purple,
                            BlendMode.srcIn,
                          ),
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditIndicator() {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          Icon(Icons.edit_outlined, size: 16.w, color: MyColors.text.secondary),
          SizedBox(width: 4.w),
          Text(
            'Editing comment',
            style: MyTextStyles.caption.captionNotes.copyWith(
              color: MyColors.text.secondary,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onCancelEdit,
            child: Icon(
              Icons.close,
              size: 16.w,
              color: MyColors.text.secondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReplyIndicator() {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          Icon(Icons.reply, size: 16.w, color: MyColors.text.secondary),
          SizedBox(width: 4.w),
          Text(
            'Replying to $replyingToName',
            style: MyTextStyles.caption.captionNotes.copyWith(
              color: MyColors.text.secondary,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onCancelReply,
            child: Icon(
              Icons.close,
              size: 16.w,
              color: MyColors.text.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
