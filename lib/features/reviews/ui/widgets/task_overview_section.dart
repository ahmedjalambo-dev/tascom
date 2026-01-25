import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

// استدعاء الويدجتات الريوزبل
import 'task_attribute_card.dart';
import 'priority_widget.dart';
import 'points_widget.dart';
import 'status_widget.dart';

class TaskOverviewSection extends StatelessWidget {
  const TaskOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // عنوان القسم
        Text(
          "Task Overview",
          style: MyTextStyle.heading.h32.copyWith(color: MyColors.text.primary),
        ),
        SizedBox(height: 12.h),

        // صندوق المعلومات
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: MyColors.background.secondary,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: MyColors.border.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // عنوان المهمة
              Text(
                "Need Help with Grocery Shopping",
                style: MyTextStyle.heading.h32.copyWith(
                  fontSize: 16.sp,
                  color: MyColors.text.primary,
                ),
              ),
              SizedBox(height: 16.h),

              // الصف الأول: Priority و Points
              Row(
                children: [
                  Expanded(
                    child: TaskAttributeCard(
                      label: "Priority",
                      content: PriorityWidget(
                        text: "High Priority",
                        color: MyColors.priority.high.text,
                      ),
                      backgroundColor: MyColors.background.primary,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: TaskAttributeCard(
                      label: "Points",
                      content: PointsWidget(
                        text: "+300 pts",
                        color: MyColors.brand.purple,
                      ),
                      backgroundColor: MyColors.background.primary,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12.h),

              // الصف الثاني: Category و Status
              Row(
                children: [
                  // داخل قسم Category
Expanded(
  child: TaskAttributeCard(
    label: "Category",
    content: Container(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w), // تقليل البادينج قليلاً
      decoration: BoxDecoration(
        color: MyColors.background.cardHover,
        borderRadius: BorderRadius.circular(12.r)
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.home_repair_service, color: MyColors.brand.purple, size: 14.sp), // تصغير الأيقونة قليلاً
            SizedBox(width: 2.w),
            Text(
              "Home Services",
              style: MyTextStyle.label.label2.copyWith(color: MyColors.brand.purple),
            ),
          ],
        ),
      ),
    ),
    backgroundColor: MyColors.background.primary,
  ),
),
                 
                  SizedBox(width: 12.w),
                  Expanded(
                    child: TaskAttributeCard(
                      label: "Status",
                      content: StatusWidget(
                        text: "Completed",
                        color: MyColors.status.completed,
                      ),
                      backgroundColor: MyColors.background.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
