import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/extentions/extentions.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_app_bar.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/settings/requests/data/models/task_claim_group_model.dart';
import 'package:tascom/features/settings/requests/data/requests_mock_data.dart';
import 'package:tascom/features/settings/requests/widgets/claimer_card.dart';
import 'package:tascom/features/settings/requests/widgets/task_claim_header_card.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  List<TaskClaimGroupModel> _taskClaimGroups = RequestsMockData.taskClaimGroups;

  int get _totalPendingCount =>
      RequestsMockData.totalPendingCount(_taskClaimGroups);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.primary,
      body: Column(
        children: [
          _buildAppBar(),
          Expanded(
            child: RefreshIndicator(
              color: MyColors.brand.purple,
              onRefresh: _onRefresh,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const VerticalSpace(16),
                  _buildSectionHeader(),
                  const VerticalSpace(12),
                  ..._taskClaimGroups
                      .where((g) => g.claimers.isNotEmpty)
                      .map(_buildTaskClaimSection),
                  const VerticalSpace(24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return MyAppBar(
      leading: GestureDetector(
        onTap: () => context.pop(),
        child: Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: SvgPicture.asset(
            MyIcons.arrowBack,
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(
              MyColors.text.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      title: Center(
        child: Text(
          'Requests',
          style: MyTextStyles.heading.h22.copyWith(
            color: MyColors.text.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pending Claims',
            style: MyTextStyles.heading.h22.copyWith(
              color: MyColors.text.primary,
            ),
          ),
          const VerticalSpace(4),
          Text(
            'You have $_totalPendingCount people waiting for approval',
            style: MyTextStyles.body.body2.copyWith(
              color: MyColors.text.secondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskClaimSection(TaskClaimGroupModel group) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: MyColors.background.secondary,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: MyColors.border.postBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TaskClaimHeaderCard(taskGroup: group),
          ...group.claimers.map(
            (claimer) => ClaimerCard(
              claimer: claimer,
              onAccept: () =>
                  _handleAccept(group.taskId, claimer.id, claimer.name),
              onIgnore: () =>
                  _handleIgnore(group.taskId, claimer.id, claimer.name),
            ),
          ),
        ],
      ),
    );
  }

  void _handleAccept(String taskId, String claimerId, String name) {
    setState(() {
      _taskClaimGroups = _taskClaimGroups
          .map((g) => g.taskId == taskId ? g.copyWithoutClaimer(claimerId) : g)
          .toList();
    });
    _showSnackBar('Claim accepted from $name');
  }

  void _handleIgnore(String taskId, String claimerId, String name) {
    setState(() {
      _taskClaimGroups = _taskClaimGroups
          .map((g) => g.taskId == taskId ? g.copyWithoutClaimer(claimerId) : g)
          .toList();
    });
    _showSnackBar('Claim ignored from $name');
  }

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _taskClaimGroups = RequestsMockData.taskClaimGroups;
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
