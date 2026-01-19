import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/features/settings/data/models/report_model.dart';
import 'package:tascom/features/settings/widgets/report_card.dart';

import 'package:tascom/features/settings/widgets/reports_empty_state.dart';
import 'package:tascom/core/widgets/custom_pill_dropdown.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  String selectedFilter = 'All';

  // Mock data - In a real app, this would come from an API via a Bloc/Cubit
  final List<ReportModel> reports = [
    ReportModel(
      id: '123',
      title: 'Gardening Help Needed for My Backyard',
      imageUrl: 'https://images.unsplash.com/photo-1585320806297-9794b3e4eeae',
      reportedDate: 'Oct 12, 2023',
      status: 'Pending',
      reason: 'Inappropriate or offensive content',
    ),
    ReportModel(
      id: '456',
      title: 'Need Someone to Take Care of My Cat',
      imageUrl: 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba',
      reportedDate: 'May 08, 2023',
      status: 'Resolved',
      reason: 'Inappropriate or offensive content',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.secondary,
      appBar: AppBar(
        title: Text(
          "Reports",
          style: MyTextStyle.heading.h32.copyWith(
            color: MyColors.text.primary,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.vertical(
            bottom: Radius.circular(16)
          )
        ),
        centerTitle: true,
        backgroundColor: MyColors.background.primary,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: MyColors.text.primary,
            size: 20.sp,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
     
      ),
      body: reports.isEmpty ? const ReportsEmptyState() : _buildReportsList(),
    );
  }

  Widget _buildReportsList() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Reported",
                style: MyTextStyle.body.body2.copyWith(
                  color: MyColors.text.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            CustomPillDropdown<String>(
              value: selectedFilter,
              items: const ['All', 'Pending', 'Resolved'],
              itemLabelBuilder: (value) => value,
              onChanged: (newValue) {
                if (newValue != null) {
                  setState(() => selectedFilter = newValue);
                }
              },
            ),
          ],
        ),
      ),
      Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: reports.length,
            itemBuilder: (context, index) {
              return ReportCard(
                report: reports[index],
                onViewDetails: () {
                  // Navigate to details
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
