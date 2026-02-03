import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/home/data/models/task_category.dart';
import 'package:tascom/features/home/data/models/task_model.dart';
import 'package:tascom/features/home/data/models/task_status.dart';
import 'package:tascom/features/user/widgets/profile_tab_selector.dart';

class ProfileTaskCard extends StatelessWidget {
  final TaskModel task;
  final ProfileTab currentTab;
  final VoidCallback? onRemoveTask;
  final VoidCallback? onViewApplicants;
  final VoidCallback? onCancelTask;
  final VoidCallback? onMarkAsDone;

  const ProfileTaskCard({
    super.key,
    required this.task,
    required this.currentTab,
    this.onRemoveTask,
    this.onViewApplicants,
    this.onCancelTask,
    this.onMarkAsDone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: MyColors.background.primary,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: MyColors.border.postBorder, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleRow(),
          const VerticalSpace(4),
          _buildDateText(),
          if (_shouldShowUserRow()) ...[
            const VerticalSpace(12),
            _buildUserRow(),
          ],
          const VerticalSpace(12),
          _buildChipsRow(),
          const VerticalSpace(16),
          _buildBottomSection(),
        ],
      ),
    );
  }

  Widget _buildTitleRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            task.title,
            style: MyTextStyles.button.secondaryButton2.copyWith(
              color: MyColors.text.primary,
            ),
          ),
        ),
        const HorizontalSpace(12),
        _buildStatusChip(),
      ],
    );
  }

  Widget _buildStatusChip() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: task.status.backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        task.status.displayName,
        style: MyTextStyles.label.label1.copyWith(
          color: task.status.textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildDateText() {
    String dateText;
    if (task.status == TaskStatus.cancelled && task.cancelledAt != null) {
      dateText =
          'Canceled date: ${DateFormat('dd/MM/yyyy').format(task.cancelledAt!)}';
    } else {
      dateText = 'Posted ${task.timeAgo}';
    }

    return Text(
      dateText,
      style: MyTextStyles.caption.captionNotes.copyWith(
        color: MyColors.text.secondary,
      ),
    );
  }

  bool _shouldShowUserRow() {
    return task.status == TaskStatus.inProgress ||
        task.status == TaskStatus.completed ||
        task.status == TaskStatus.cancelled;
  }

  Widget _buildUserRow() {
    final user = currentTab == ProfileTab.posted ? task.helper : task.author;
    final label = currentTab == ProfileTab.posted ? 'Helper' : 'Poster';

    if (user == null) return const SizedBox.shrink();

    return Row(
      children: [
        CircleAvatar(
          radius: 14.r,
          backgroundColor: MyColors.background.cardHover,
          backgroundImage: user.avatar != null
              ? NetworkImage(user.avatar!)
              : null,
          child: user.avatar == null
              ? Text(
                  user.name.isNotEmpty ? user.name[0].toUpperCase() : '?',
                  style: MyTextStyles.label.label2.copyWith(
                    color: MyColors.brand.purple,
                  ),
                )
              : null,
        ),
        const HorizontalSpace(8),
        Text(
          '$label: ',
          style: MyTextStyles.body.body2.copyWith(
            color: MyColors.text.secondary,
          ),
        ),
        Text(
          user.name,
          style: MyTextStyles.body.body2.copyWith(
            color: MyColors.text.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildChipsRow() {
    return Row(
      children: [
        _buildCategoryChip(),
        const HorizontalSpace(8),
        _buildLocationChip(),
      ],
    );
  }

  Widget _buildCategoryChip() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: task.category.backgroundColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            task.category.icon,
            width: 14.w,
            height: 14.h,
            colorFilter: ColorFilter.mode(
              task.category.textColor,
              BlendMode.srcIn,
            ),
          ),
          const HorizontalSpace(4),
          Text(
            task.category.displayName,
            style: MyTextStyles.label.label1.copyWith(
              color: task.category.textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationChip() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: MyColors.brand.purple.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            MyIcons.locationSolid,
            width: 14.w,
            height: 14.h,
            colorFilter: ColorFilter.mode(
              MyColors.brand.purple,
              BlendMode.srcIn,
            ),
          ),
          const HorizontalSpace(4),
          Text(
            task.location.name,
            style: MyTextStyles.label.label1.copyWith(
              color: MyColors.brand.purple,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSection() {
    switch (task.status) {
      case TaskStatus.active:
        return _buildActiveActions();
      case TaskStatus.inProgress:
        return _buildInProgressActions();
      case TaskStatus.completed:
        return _buildClaimedByRow();
      case TaskStatus.cancelled:
        return _buildClaimedByRow();
      case TaskStatus.open:
        return _buildActiveActions();
    }
  }

  Widget _buildActiveActions() {
    return Row(
      children: [
        Expanded(
          child: _buildOutlinedButton(
            text: 'Remove task',
            onTap: onRemoveTask,
            isDestructive: true,
          ),
        ),
        const HorizontalSpace(12),
        Expanded(
          child: _buildFilledButton(
            text: 'View Applicats',
            onTap: onViewApplicants,
          ),
        ),
      ],
    );
  }

  Widget _buildInProgressActions() {
    return Row(
      children: [
        Expanded(
          child: _buildOutlinedButton(
            text: 'cancel task',
            onTap: onCancelTask,
            isDestructive: true,
          ),
        ),
        const HorizontalSpace(12),
        Expanded(
          child: _buildFilledButton(text: 'Mark as done', onTap: onMarkAsDone),
        ),
      ],
    );
  }

  Widget _buildClaimedByRow() {
    final claimedByName = currentTab == ProfileTab.posted
        ? task.helper?.name ?? 'Unknown'
        : 'Me';
    final points = task.metrics.points;

    return Row(
      children: [
        SvgPicture.asset(
          MyIcons.userStroke,
          width: 16.w,
          height: 16.h,
          colorFilter: ColorFilter.mode(
            MyColors.text.secondary,
            BlendMode.srcIn,
          ),
        ),
        const HorizontalSpace(6),
        Text(
          'Claimed by $claimedByName',
          style: MyTextStyles.body.body2.copyWith(
            color: MyColors.text.secondary,
          ),
        ),
        const Spacer(),
        Text(
          '-${points}pts',
          style: MyTextStyles.body.body2.copyWith(
            color: MyColors.text.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildOutlinedButton({
    required String text,
    required VoidCallback? onTap,
    bool isDestructive = false,
  }) {
    final color = isDestructive
        ? MyColors.status.cancelled
        : MyColors.brand.purple;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: color, width: 1.5),
        ),
        child: Center(
          child: Text(
            text,
            style: MyTextStyles.button.secondaryButton2.copyWith(color: color),
          ),
        ),
      ),
    );
  }

  Widget _buildFilledButton({
    required String text,
    required VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: MyColors.brand.purple,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Center(
          child: Text(
            text,
            style: MyTextStyles.button.secondaryButton2.copyWith(
              color: MyColors.text.white,
            ),
          ),
        ),
      ),
    );
  }
}
