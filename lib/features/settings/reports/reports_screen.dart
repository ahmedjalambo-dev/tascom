import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/extentions/extentions.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_app_bar.dart';
import 'package:tascom/core/widgets/my_filter_dropdown.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/settings/reports/data/models/report_model.dart';
import 'package:tascom/features/settings/reports/data/reports_mock_data.dart';
import 'package:tascom/features/settings/reports/widgets/report_card.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  ReportStatus? _selectedFilter;

  List<Report> get _filteredReports {
    if (_selectedFilter == null) {
      return ReportsData.reports;
    }
    return ReportsData.reports
        .where((r) => r.status == _selectedFilter)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.primary,
      body: Column(
        children: [
          _buildAppBar(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const VerticalSpace(16),
                _buildHeader(),
                const VerticalSpace(12),
                ..._filteredReports.map(
                  (report) => ReportCard(
                    report: report,
                    onViewDetails: () {
                      _showSnackBar('View details for ${report.taskTitle}');
                    },
                  ),
                ),
                const VerticalSpace(24),
              ],
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
          'Reports',
          style: MyTextStyles.heading.h22.copyWith(
            color: MyColors.text.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Reported',
            style: MyTextStyles.heading.h32.copyWith(
              color: MyColors.text.primary,
            ),
          ),
          MyFilterDropdown<ReportStatus>(
            items: ReportStatus.values,
            selectedValue: _selectedFilter,
            labelBuilder: (status) => status.displayName,
            allOptionLabel: 'All',
            onChanged: (status) {
              setState(() => _selectedFilter = status);
            },
          ),
        ],
      ),
    );
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
