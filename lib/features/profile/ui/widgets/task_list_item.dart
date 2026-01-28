

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/features/profile/data/task_model.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/profile/ui/widgets/task_action_button.dart';
import 'package:tascom/features/reviews/ui/screens/rate_helper_screen.dart';

class TaskListItem extends StatelessWidget {
  final TaskModel task;
  final VoidCallback? onTap;
  final bool isPostedTab;

  const TaskListItem({
    super.key,
    required this.task,
    this.onTap,
    required this.isPostedTab,
  });

  Color _getStatusColor() {
    switch (task.status.toLowerCase()) {
      case 'active':
        return MyColors.status.active;
      case 'in progress':
        return MyColors.status.inProgress;
      case 'completed':
        return MyColors.status.completed;
      case 'canceled':
        return MyColors.status.cancelled;
      default:
        return MyColors.text.secondary;
    }
  }

  Color _getStatusBackgroundColor() => _getStatusColor().withValues(alpha: 0.1);

  @override
  Widget build(BuildContext context) {
    final String status = task.status.toLowerCase();

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: MyColors.background.primary,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: MyColors.border.border.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. العناوين والحالة
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  task.title,
                  style: MyTextStyle.body.body2.copyWith(
                    fontWeight: FontWeight.w600,
                    color: MyColors.text.primary,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: _getStatusBackgroundColor(),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  task.status,
                  style: MyTextStyle.label.label2.copyWith(
                    color: _getStatusColor(),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            "Posted ${task.timeAgo}",
            style: MyTextStyle.label.label1.copyWith(
              color: MyColors.text.third,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 13.h),

          // 2. اسم الشخص (Helper أو Poster)
          if (status == 'in progress' || status == 'completed')
            Padding(
              padding: EdgeInsets.only(bottom: 8.0.h),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: MyColors.background.secondary,
                  borderRadius: BorderRadius.circular(50.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 10.r,
                      offset: Offset(0, 4.h),
                    )
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 10.r,
                      backgroundImage: const NetworkImage("https://i.pravatar.cc/300?img=12"),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      isPostedTab
                          ? "Helper: ${task.helperName ?? 'Ali Rayyan'}"
                          : "Poster: ${task.posterName ?? 'Sara Ahmad'}",
                      style: MyTextStyle.label.label1.copyWith(
                        color: MyColors.text.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // 3. التاجات (Category & Location)
          Row(
            children: [
              _buildTag(Icons.home_repair_service, task.category),
              SizedBox(width: 12.w),
              _buildTag(Icons.location_on, task.location),
            ],
          ),

          // --- 4. الجزء السفلي (الخط الفاصل + الأزرار أو تفاصيل النقاط) ---
          if ((status == 'active' && isPostedTab) || 
              (status == 'in progress') || 
              (status == 'canceled') || 
              (status == 'completed' && !isPostedTab)) ...[
            
            // الخط الفاصل المطور (Container لضمان الوضوح)
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.h),
              width: double.infinity,
              height: 1.2.h,
              color: MyColors.border.border.withValues(alpha: 0.4),
            ),

            // أزرار حالة Active (فقط في تبويب المنشورات الخاصة بي)
            if (status == 'active' && isPostedTab)
              Row(
                children: [
                  Expanded(child: TaskActionButton(label: "Remove task", color: MyColors.states.error, isOutlined: true, onPressed: () {})),
                  SizedBox(width: 8.w),
                  Expanded(child: TaskActionButton(label: "View Applicants", color: MyColors.brand.purple, onPressed: () {})),
                ],
              ),

            // أزرار حالة In Progress (نفس الأسماء في كلا التبويبين)
            if (status == 'in progress')
              Row(
                children: [
                  Expanded(child: TaskActionButton(label: "Cancel task", color: MyColors.states.error, isOutlined: true, onPressed: () {})),
                  SizedBox(width: 8.w),
                  Expanded(child: TaskActionButton(label: "Mark as done", color: MyColors.brand.purple, onPressed: () {
                    
                       Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RateHelperScreen(),
        ),
                       );


                  })),
                ],
              ),

            // تفاصيل حالة Canceled
            if (status == 'canceled')
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person_outline, size: 16.sp, color: MyColors.text.third),
                      SizedBox(width: 4.w),
                      Text(
                        isPostedTab ? "Claimed by Helper" : "Claimed by Me",
                        style: MyTextStyle.label.label2.copyWith(color: MyColors.text.third),
                      )
                    ],
                  ),
                  Text("-300pts", style: MyTextStyle.label.label2.copyWith(color: MyColors.text.third))
                ],
              ),

            // تفاصيل حالة Completed (تظهر فقط في تبويب Claimed)
            if (status == 'completed' && !isPostedTab)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.percent_outlined, size: 16.sp, color: MyColors.text.third),
                      SizedBox(width: 4.w),
                      Text("Earned from task", style: MyTextStyle.label.label2.copyWith(color: MyColors.text.third)),
                    ],
                  ),
                  Text("+300 pts", style: MyTextStyle.label.label2.copyWith(color: MyColors.text.third, fontWeight: FontWeight.w600)),
                ],
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildTag(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: MyColors.background.cardHover,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14.sp, color: MyColors.brand.purple),
          SizedBox(width: 4.w),
          Flexible(
            child: Text(
              text,
              style: MyTextStyle.label.label2.copyWith(
                fontSize: 11,
                color: MyColors.brand.purple,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

