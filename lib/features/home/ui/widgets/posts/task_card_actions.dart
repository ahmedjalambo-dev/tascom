import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';

class TaskCardActions extends StatelessWidget {
  final int likeCount;
  final int commentCount;
  final bool isLiked;
  final bool isClaimed;
  final bool isClaimLoading;
  final VoidCallback? onLikeTap;
  final VoidCallback? onCommentTap;
  final VoidCallback? onShareTap;
  final VoidCallback? onClaimTap;

  const TaskCardActions({
    super.key,
    required this.likeCount,
    required this.commentCount,
    this.isLiked = false,
    this.isClaimed = false,
    this.isClaimLoading = false,
    this.onLikeTap,
    this.onCommentTap,
    this.onShareTap,
    this.onClaimTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Like Button
        GestureDetector(
          onTap: onLikeTap,
          child: Row(
            children: [
              SvgPicture.asset(
                isLiked ? MyIcons.likeSolid : MyIcons.likeStroke,
                width: 20.w,
                height: 20.w,
                colorFilter: ColorFilter.mode(
                  isLiked
                      ? MyColors.priority.high.text
                      : MyColors.text.secondary,
                  BlendMode.srcIn,
                ),
              ),
              const HorizontalSpace(4),
              Text(
                likeCount.toString(),
                style: MyTextStyles.label.label1.copyWith(
                  color: MyColors.text.secondary,
                ),
              ),
            ],
          ),
        ),
        const HorizontalSpace(16),

        // Comment Button
        GestureDetector(
          onTap: onCommentTap,
          child: Row(
            children: [
              SvgPicture.asset(
                MyIcons.chatStroke,
                width: 20.w,
                height: 20.w,
                colorFilter: ColorFilter.mode(
                  MyColors.text.secondary,
                  BlendMode.srcIn,
                ),
              ),
              const HorizontalSpace(4),
              Text(
                commentCount.toString(),
                style: MyTextStyles.label.label1.copyWith(
                  color: MyColors.text.secondary,
                ),
              ),
            ],
          ),
        ),
        const HorizontalSpace(16),

        // Share Button
        GestureDetector(
          onTap: onShareTap,
          child: SvgPicture.asset(
            MyIcons.forwardStroke,
            width: 20.w,
            height: 20.w,
            colorFilter: ColorFilter.mode(
              MyColors.text.secondary,
              BlendMode.srcIn,
            ),
          ),
        ),

        const Spacer(),

        // Claim Task Button
        ElevatedButton(
          onPressed: (isClaimed || isClaimLoading) ? null : onClaimTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: isClaimed
                ? MyColors.status.pending
                : MyColors.brand.purple,
            foregroundColor: MyColors.text.white,
            disabledBackgroundColor: isClaimLoading
                ? MyColors.brand.purple
                : MyColors.status.pending,
            disabledForegroundColor: MyColors.text.white,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.r),
            ),
            elevation: 0,
          ),
          child: isClaimLoading
              ? SizedBox(
                  width: 16.w,
                  height: 16.w,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: MyColors.text.white,
                  ),
                )
              : Text(
                  isClaimed ? 'Pending' : 'Claim Now',
                  style: MyTextStyles.button.smallButtons.copyWith(
                    color: MyColors.text.white,
                  ),
                ),
        ),
      ],
    );
  }
}
