import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/settings/reports/data/models/report_model.dart';

class ReportCard extends StatelessWidget {
  final Report report;
  final VoidCallback? onViewDetails;

  const ReportCard({super.key, required this.report, this.onViewDetails});

  String get _formattedDate {
    return 'Reported on ${DateFormat('MMM dd, yyyy').format(report.reportedAt)}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: MyColors.background.secondary,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: MyColors.border.postBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDateAndStatus(),
                const VerticalSpace(8),
                _buildTitle(),
                const VerticalSpace(8),
                _buildReason(),
                const VerticalSpace(12),
                _buildFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.r),
        topRight: Radius.circular(16.r),
      ),
      child: Image.asset(
        report.taskImageUrl,
        width: double.infinity,
        height: 180.h,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: double.infinity,
            height: 180.h,
            decoration: BoxDecoration(
              color: MyColors.background.secondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            child: Icon(
              Icons.image_outlined,
              size: 48.w,
              color: MyColors.text.third,
            ),
          );
        },
      ),
    );
  }

  Widget _buildDateAndStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _formattedDate,
          style: MyTextStyles.caption.captionNotes.copyWith(
            color: MyColors.text.secondary,
          ),
        ),
        _buildStatusChip(),
      ],
    );
  }

  Widget _buildStatusChip() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: report.status.backgroundColor.withAlpha(50),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        report.status.displayName,
        style: MyTextStyles.caption.captionNotes.copyWith(
          color: report.status.textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      report.taskTitle,
      style: MyTextStyles.body.body1.copyWith(
        color: MyColors.text.primary,
        fontWeight: FontWeight.w600,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildReason() {
    return Text(
      'Reason: ${report.reason}',
      style: MyTextStyles.body.body2.copyWith(color: MyColors.text.secondary),
    );
  }

  Widget _buildFooter() {
    return Row(
      children: [
        SvgPicture.asset(
          MyIcons.alertStroke,
          width: 16.w,
          height: 16.h,
          colorFilter: ColorFilter.mode(
            MyColors.text.secondary,
            BlendMode.srcIn,
          ),
        ),
        HorizontalSpace(6.w),
        Text(
          'Report ID:${report.reportId}',
          style: MyTextStyles.caption.captionNotes.copyWith(
            color: MyColors.text.secondary,
          ),
        ),
        HorizontalSpace(16.w),
        GestureDetector(
          onTap: onViewDetails,
          child: Text(
            'View Details',
            style: MyTextStyles.body.body2.copyWith(
              color: MyColors.brand.purple,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
