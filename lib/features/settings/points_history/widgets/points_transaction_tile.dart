import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/settings/points_history/data/models/points_transaction.dart';

class PointsTransactionTile extends StatelessWidget {
  final PointsTransaction transaction;

  const PointsTransactionTile({super.key, required this.transaction});

  String get _formattedDate {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final transactionDay = DateTime(
      transaction.date.year,
      transaction.date.month,
      transaction.date.day,
    );

    if (transactionDay == today) {
      return 'Today, ${DateFormat('h:mm a').format(transaction.date)}';
    }
    return DateFormat('MMM d, yyyy').format(transaction.date);
  }

  String get _formattedPoints {
    if (transaction.points > 0) {
      return '+${transaction.points} pts';
    }
    return '${transaction.points} pts';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: MyColors.background.secondary,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          _buildIcon(),
          HorizontalSpace(12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.taskName,
                  style: MyTextStyles.body.body1.copyWith(
                    color: MyColors.text.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const VerticalSpace(4),
                Text(
                  _formattedDate,
                  style: MyTextStyles.caption.captionNotes.copyWith(
                    color: MyColors.text.secondary,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildStatusChip(),
              const VerticalSpace(4),
              Text(
                _formattedPoints,
                style: MyTextStyles.body.body2.copyWith(
                  color: transaction.isEarned
                      ? MyColors.brand.purple
                      : MyColors.text.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      width: 44.w,
      height: 44.w,
      decoration: BoxDecoration(
        color: MyColors.priority.low.bg,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SvgPicture.asset(
          transaction.isEarned ? MyIcons.upArrow : MyIcons.downArrow,
          width: 20.w,
          height: 20.w,
          colorFilter: ColorFilter.mode(MyColors.brand.purple, BlendMode.srcIn),
        ),
      ),
    );
  }

  Widget _buildStatusChip() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: transaction.status.backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        transaction.status.displayName,
        style: MyTextStyles.caption.captionNotes.copyWith(
          color: transaction.status.textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
