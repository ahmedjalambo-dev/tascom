import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/core/widgets/custom_pill_dropdown.dart';
import 'package:tascom/features/settings/points/data/point_model.dart';

import 'package:tascom/features/settings/points/ui/widgets/point_history_item.dart';
import 'package:tascom/features/settings/points/ui/widgets/points_balance_card.dart';
import 'package:tascom/features/settings/points/ui/widgets/points_empty_state.dart';

class PointsHistoryScreen extends StatefulWidget {
  const PointsHistoryScreen({super.key});

  @override
  State<PointsHistoryScreen> createState() => _PointsHistoryScreenState();
}

class _PointsHistoryScreenState extends State<PointsHistoryScreen> {
  String selectedFilter = 'All';

  // Mock data
  final List<PointModel> pointsHistory = [
    const PointModel(
      id: '1',
      taskName: 'Task Name',
      date: 'Today, 2:30 PM',
      points: 30,
      status: PointStatus.completed,
    ),
    const PointModel(
      id: '2',
      taskName: 'Task Name',
      date: 'Oct 24, 2023',
      points: 25,
      status: PointStatus.cancelled,
      isNegative: true,
    ),
    const PointModel(
      id: '3',
      taskName: 'Task Name',
      date: 'Oct 11, 2023',
      points: 40,
      status: PointStatus.completed,
    ),
    const PointModel(
      id: '4',
      taskName: 'Task Name',
      date: 'Oct 11, 2023',
      points: 40,
      status: PointStatus.completed,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // For demonstration, you can toggle between pointsHistory or []
    final isEmpty = pointsHistory.isEmpty;
    final totalPoints = isEmpty ? 0 : 5385;

    return Scaffold(
    backgroundColor: MyColors.background.secondary,

      appBar: AppBar(
        backgroundColor: MyColors.background.primary,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: MyColors.text.primary, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Points History",
          style: MyTextStyle.heading.h22.copyWith(color: MyColors.text.primary),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.r)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            PointsBalanceCard(balance: totalPoints),
            SizedBox(height: 24.h),
            _buildHistoryHeader(),
            SizedBox(height: 16.h),
            Expanded(
              child: isEmpty ? const PointsEmptyState() : _buildHistoryList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "History",
          style: MyTextStyle.heading.h32.copyWith(
            color: MyColors.text.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
        CustomPillDropdown<String>(
          value: selectedFilter,
          items: const ['All', 'Completed', 'Cancelled'],
          itemLabelBuilder: (value) => value,
          onChanged: (newValue) {
            if (newValue != null) {
              setState(() => selectedFilter = newValue);
            }
          },
        ),
      ],
    );
  }

  Widget _buildHistoryList() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: pointsHistory.length,
      itemBuilder: (context, index) {
        return PointHistoryItem(point: pointsHistory[index]);
      },
    );
  }
}
