import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/features/profile/data/task_model.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class TaskListItem extends StatelessWidget {
  final TaskModel task;
  final VoidCallback? onTap;

  const TaskListItem({
    super.key,
    required this.task,
    this.onTap,
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

  Color _getStatusBackgroundColor() {
    return _getStatusColor().withOpacity(0.1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: MyColors.background.secondary,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: MyColors.border.border.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  //العنوان
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
                  //الحالة
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
          //الوقت منذ نشر المهمة
          Text(
            "Posted ${task.timeAgo}",
            style: MyTextStyle.label.label1.copyWith(
              color: MyColors.text.third,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),

          // Conditional Content based on State
          //هنا لو فى متقدمين أعرض اسمه وصوته اذا لا تجاهل
          if (task.applicantsCount != null)
          
              Row(
                children: [
                   Icon(Icons.person, size: 16.sp, color: MyColors.status.completed),
                   SizedBox(width: 4.w),
                 //عدد المتقدمين للمهمة
                  Text(
                    "${task.applicantsCount} applicants",
                    style: MyTextStyle.body.body2.copyWith(
                      color: MyColors.status.completed,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                    ),
                  ),
               ],
             ),

          if (task.helperName != null)
          //عرض اسم الشخص المتقدم للمهمة
              Padding(
                padding: EdgeInsets.only(bottom: 8.0.h),
                child: Container(
                 padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                 decoration: BoxDecoration(
                   color: MyColors.background.secondary,
                   borderRadius: BorderRadius.circular(50.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10.r,
                      offset: Offset(0, 4.h),
                    )
                  ]
                ),
                 child: Row(
                  mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 10.r,
                        backgroundImage: const NetworkImage("https://i.pravatar.cc/300?img=12"), // Placeholder
                      ),
                      SizedBox(width: 8.w),
                     //هنا عرض اسم الشخص المتقدم للخدمة
                      Text(
                        "Helper: ${task.helperName}",
                        style: MyTextStyle.label.label1.copyWith(
                          color: MyColors.text.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                   ],
                 ),
               ),
             ),

          const SizedBox(height: 12),
          
          Row(
            children: [
              _buildTag(Icons.home_repair_service, task.category),
              SizedBox(width: 12.w),
              _buildTag(Icons.location_on, task.location),
            ],
          ),
           //هنا حالة انا اكتيف
           //صاحب المهمة وهو اكتيف بس يقدر يشوف زر الحذف
          if (task.status.toLowerCase() == 'active' && task.isPostedByMe) ...[
            const SizedBox(height: 16),
            Align(
              alignment: AlignmentGeometry.centerRight,
              child: SizedBox(
                height: 32.h,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.restore_from_trash_outlined, size: 20.sp, color: MyColors.status.cancelled),
                  label: Text(
                    "Remove task",
                    style: MyTextStyle.label.label2.copyWith(
                      color: MyColors.status.cancelled,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: MyColors.status.cancelled, width: 1.5.w), // Stronger red
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                  ),
                ),
              ),
            ),
          ],
          //يعنى المهمة شغالة وأنا يلى نشرتها وعندى قرارات
         if (task.status.toLowerCase() == 'in progress' && task.isPostedByMe) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){}, 
                     style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.brand.purple,
                       shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text("Mark as done", style: MyTextStyle.label.label1.copyWith(color: MyColors.text.white, fontWeight: FontWeight.w600),)
                  )
                ),
                const SizedBox(width: 12),
                 Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.close, size: 16.sp, color: MyColors.status.cancelled),
                    label: Text(
                      "Cancel task",
                      style: MyTextStyle.label.label2.copyWith(
                        color: MyColors.status.cancelled,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: MyColors.status.cancelled),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
      //هنا حالة المهمة خلصت ما فى أزرار فقط معلومات
          if (task.status.toLowerCase() == 'canceled') ...[
             const SizedBox(height: 12),
              
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                     Row(
                      children: [
                        Icon(Icons.person_outline, size: 16.sp, color: MyColors.text.third),
                         SizedBox(width: 4.w),
                        Text("Claimed by Me", style: MyTextStyle.label.label2.copyWith(color: MyColors.text.third),)
                      ],
                     ),
                      Text("-300pts", style: MyTextStyle.label.label2.copyWith(color: MyColors.text.third),)
                 ],
               )
          ],

       
if (task.status.toLowerCase() == 'completed') ...[
  const SizedBox(height: 12),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Icon(Icons.percent_outlined, size: 16.sp, color: MyColors.text.third),
          SizedBox(width: 4.w),
          Text(
            "Claimed by Ali Ahmad",
            style: MyTextStyle.label.label2.copyWith(
              color: MyColors.text.third,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      Text(
        "+300 pts",
        style: MyTextStyle.label.label2.copyWith(
          color: MyColors.text.third,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  )
]
























       
       
       
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
