import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/features/profile/data/task_model.dart';
import 'package:tascom/features/profile/ui/widgets/empty_state_widget.dart';
import 'package:tascom/features/profile/ui/widgets/profile_header.dart';
import 'package:tascom/features/profile/ui/widgets/stats_row.dart';
import 'package:tascom/features/profile/ui/widgets/task_list_item.dart';
import 'package:tascom/features/profile/ui/widgets/task_tabs.dart';

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
  String selectedTaskFilter = 'All';

  // Mock Data
  final List<TaskModel> allTasks = [
    TaskModel(
      id: "1",
      title: "Help move boxes",
      timeAgo: "2 days ago",
      status: "Active",
     
      category: "Home Services",
      location: "Nablus, Palestine",
      isPostedByMe: true,
    ),
    TaskModel(
      id: "2",
      title: "Help move boxes",
      timeAgo: "2 days ago",
      status: "In Progress",
      helperName: "Ali Rayyan",
      category: "Home Services",
      location: "Palestine, Nablus",
      isPostedByMe: true,
    ),
    TaskModel(
        id: "3",
        title: "Help move boxes",
        timeAgo: "2 days ago",
        status: "Completed",
        helperName: "Ali Rayyan",
        category: "Home Services",
        location: "Nablus, Palestine",
        isPostedByMe: true),
    TaskModel(
      id: "4",
      title: "Help move boxes",
      timeAgo: "25/12/2025",
      status: "Canceled",
      helperName: "Ali Rayyan",
      category: "Home Services",
      location: "Palestine, Nablus",
      isPostedByMe: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // For 'Posted' we show specific tasks, for 'Claimed' we show others to match the screenshots
    //اختيار المهام المعروضة
    List<TaskModel> visibleTasks;
    if (isPostedSelected) {
       visibleTasks = allTasks.where((t) => t.status == 'Active' || t.status == 'Completed'||t.status == 'In Progress').toList();
    } else {
       visibleTasks = allTasks.where((t) => t.status == 'In Progress' || t.status == 'Canceled').toList();
    }

    return Scaffold(
      backgroundColor: MyColors.background.secondary, // White background for the bottom part
      appBar: AppBar(
        title: Text(
          "Profile",
          style: MyTextStyle.heading.h32.copyWith(
            color: MyColors.text.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: MyColors.background.primary, // AppBar matches top section
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined, color: MyColors.text.primary),
            onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsScreen()),
                );
            },
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
                    child: const ProfileHeader(),
                  ),
                   SizedBox(height: 24.h),
                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                    child: const StatsRow(),
                  ),
                ],
              ),
            ),
             SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              child: TaskTabs(
                isPostedSelected: isPostedSelected,
                onPostedTap: () {
                  setState(() {
                    isPostedSelected = true;
                  });
                },
                onClaimedTap: () {
                  setState(() {
                    isPostedSelected = false;
                  });
                },
              ),
            ),
            
            // Bottom Section (Grey background from Scaffold)
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
                    items: const ['All', 'Active', 'Completed'],
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
            //هنا هل قائمة المهام فاضية
            //نعم → EmptyState
            //لا → ListView
            if (visibleTasks.isEmpty)
              EmptyStateWidget(


                // تخصيص النصوص بناءً على التبويب
    title: isPostedSelected 
        ? "You have no active tasks yet." 
        : "You have no active tasks yet.", // العنوان نفسه في الصورتين
    description: isPostedSelected 
        ? "Post a task in your community to get started." 
        : "Claim a task in your community to get started.", // هنا الاختلاف (Post vs Claim)
    buttonText: isPostedSelected 
        ? "Post a task" 
        : "Claim a task", // هنا الاختلاف في الزر
    onActionPressed: () {
      if (isPostedSelected) {
        // منطق إضافة مهمة
      } else {
        // منطق البحث عن مهمة للمطالبة بها
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
                  return TaskListItem(task: visibleTasks[index],
                  isPostedTab: isPostedSelected,
                  );
                },
              ),
             SizedBox(height: 40.h),
            // Bottom Navbar placeholder area if needed, or keeping it clean
             Padding(
               padding: EdgeInsets.only(bottom: 20.h),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                     Icon(Icons.home_outlined, color: MyColors.text.disable, size: 28.sp),
                     Icon(Icons.search, color: MyColors.text.disable, size: 28.sp),
                     Container(
                       height: 50.h,
                       width: 50.w,
                       decoration: BoxDecoration(
                         color: MyColors.brand.purple,
                         shape: BoxShape.circle,
                       ),
                       child: Icon(Icons.add, color: MyColors.text.white, size: 24.sp),
                     ),
                     Icon(Icons.work_outline, color: MyColors.text.disable, size: 28.sp),
                     Icon(Icons.person, color: MyColors.brand.purple, size: 28.sp),
                 ],
               ),
             )
          ],
        ),
      ),
    );
  }
}
