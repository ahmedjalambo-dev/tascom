import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/extentions/extentions.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/core/widgets/spacing_widgets.dart';
import 'package:tascom/features/profile/data/task_model.dart';
import 'package:tascom/features/profile/data/mock_profile_data.dart';
import 'package:tascom/features/profile/utils/task_constants.dart';
import 'package:tascom/features/profile/ui/widgets/empty_state_widget.dart';
import 'package:tascom/features/profile/ui/widgets/profile_header.dart';
import 'package:tascom/features/profile/ui/widgets/stats_row.dart';
import 'package:tascom/features/profile/ui/widgets/task_list_item.dart';
import 'package:tascom/features/profile/ui/widgets/task_tabs.dart';
import 'package:tascom/features/reviews/ui/screens/rate_helper_screen.dart';

import 'package:tascom/core/widgets/custom_pill_dropdown.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/settings/main/ui/screen/settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isPostedSelected = true;
  String selectedTaskFilter = TaskFilter.all;

  /// Filters tasks based on the current tab and selected filter.
  List<TaskModel> _getFilteredTasks() {
    final List<TaskModel> allTasks = MockProfileData.tasks;

    // First filter by tab (Posted or Claimed)
    List<TaskModel> tabFiltered;
    if (isPostedSelected) {
      tabFiltered = allTasks
          .where(
            (t) =>
                t.status == TaskStatus.active ||
                t.status == TaskStatus.completed ||
                t.status == TaskStatus.inProgress,
          )
          .toList();
    } else {
      tabFiltered = allTasks
          .where(
            (t) =>
                t.status == TaskStatus.inProgress ||
                t.status == TaskStatus.canceled,
          )
          .toList();
    }

    // Then apply dropdown filter
    if (selectedTaskFilter == TaskFilter.all) {
      return tabFiltered;
    }

    return tabFiltered.where((t) => t.status == selectedTaskFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    final visibleTasks = _getFilteredTasks();

    return Scaffold(
      backgroundColor: MyColors.background.secondary,

      appBar: AppBar(
        title: Text(
          "Profile",
          style: MyTextStyle.heading.h22.copyWith(color: MyColors.text.primary),
        ),
        centerTitle: true,
        backgroundColor: MyColors.background.primary,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () => context.pushNamed(MyRoutes.settings),
            child: Padding(
              padding: EdgeInsetsDirectional.only(end: 25.w),
              child: SvgPicture.asset('assets/icons/settings-stroke.svg'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Section with Grey Background
            Container(
              color: MyColors.background.primary,
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 24.h),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                    child: const ProfileHeader(
                      profile: MockProfileData.profile,
                    ),
                  ),
                  VerticalSpace(16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                    child: const StatsRow(profile: MockProfileData.profile),
                  ),
                ],
              ),
            ),
            VerticalSpace(24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              child: TaskTabs(
                isPostedSelected: isPostedSelected,
                onPostedTap: () {
                  HapticFeedback.selectionClick();
                  setState(() {
                    isPostedSelected = true;
                  });
                },
                onClaimedTap: () {
                  HapticFeedback.selectionClick();
                  setState(() {
                    isPostedSelected = false;
                  });
                },
              ),
            ),

            // Task Filter and List Section
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your tasks",
                    style: MyTextStyle.heading.h32.copyWith(
                      color: MyColors.text.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CustomPillDropdown<String>(
                    value: selectedTaskFilter,
                    items: TaskFilter.options,
                    itemLabelBuilder: (value) => value,
                    onChanged: (newValue) {
                      if (newValue != null) {
                        setState(() => selectedTaskFilter = newValue);
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // Task List or Empty State
            if (visibleTasks.isEmpty)
              EmptyStateWidget(
                title: isPostedSelected
                    ? "You have no active tasks yet."
                    : "You have no active tasks yet.",
                description: isPostedSelected
                    ? "Post a task in your community to get started."
                    : "Claim a task in your community to get started.",
                buttonText: isPostedSelected ? "Post a task" : "Claim a task",
                onActionPressed: () {
                  if (isPostedSelected) {
                    // Logic for posting a task
                  } else {
                    // Logic for claiming a task
                  }
                },
              )
            else
              ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: visibleTasks.length,
                itemBuilder: (context, index) {
                  return TaskListItem(
                    task: visibleTasks[index],
                    isPostedTab: isPostedSelected,
                    onMarkAsDone: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RateHelperScreen(),
                        ),
                      );
                    },
                  );
                },
              ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
