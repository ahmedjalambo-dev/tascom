import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/helpers/time_helper.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_button.dart';
import 'package:tascom/core/widgets/my_outlined_button.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/core/widgets/my_user_profile_row.dart';
import 'package:tascom/features/settings/requests/data/models/claimer_model.dart';
import 'package:tascom/features/settings/requests/widgets/stats_chip.dart';

class ClaimerCard extends StatelessWidget {
  final ClaimerModel claimer;
  final VoidCallback onAccept;
  final VoidCallback onIgnore;

  const ClaimerCard({
    super.key,
    required this.claimer,
    required this.onAccept,
    required this.onIgnore,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(height: 1, color: MyColors.border.postBorder),
          const VerticalSpace(16),
          _buildProfileRow(),
          const VerticalSpace(4),
          _buildMessage(),
          const VerticalSpace(12),
          _buildStatsRow(),
          const VerticalSpace(16),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildProfileRow() {
    return Row(
      children: [
        Expanded(
          child: MyUserProfileRow(
            name: claimer.name,
            subtitle: 'Sent ${calculateTimeAgo(claimer.claimedAt)}',
            avatarUrl: claimer.avatarUrl,
            avatarRadius: 24.r,
          ),
        ),
      ],
    );
  }

  Widget _buildMessage() {
    return Padding(
      padding: EdgeInsets.only(left: 60.w),
      child: Text(
        claimer.message,
        style: MyTextStyles.body.body2.copyWith(color: MyColors.brand.purple),
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        StatsChip(
          icon: MyIcons.trueSolid,
          label: '${claimer.tasksCompleted} tasks done',
          iconColor: MyColors.states.success,
        ),
        const HorizontalSpace(8),
        StatsChip(
          icon: MyIcons.starSolid,
          label: claimer.rating.toString(),
          iconColor: MyColors.icons.star,
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: MyOutlinedButton(text: 'Ignore', onPressed: onIgnore),
        ),
        const HorizontalSpace(12),
        Expanded(
          child: MyButton(text: 'Accept', onPressed: onAccept),
        ),
      ],
    );
  }
}
