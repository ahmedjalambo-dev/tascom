import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/features/settings/saved_tasks/ui/widgets/saved_task_card.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class SavedTasksScreen extends StatelessWidget {
  const SavedTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // القائمة فارغة الآن لتجربة حالة الـ Empty
    final List<Map<String, String>> savedTasks = [
 {
        "title": "Need Someone to Take Care of My Cat",
        "points": "30 Points",
        "description": "I need someone to take care of my cat for a...",
        "image": "assets/images/Rectangle 28.png"
      },
      {
        "title": "Need Help with Fixing My Front Door",
        "points": "20 Points",
        "description": "I need someone to help fix my front door lock...",
        "image": "assets/images/Rectangle 29 (1).png"
      },
      {
        "title": "Large Bus Rental for Group Trip",
        "points": "55 Points",
        "description": "Looking to rent a spacious bus for an upcoming...",
        "image": "assets/images/Rectangle 29 (2).png"
      },
      {
        "title": "Help with Apartment Clean",
        "points": "25 Points",
        "description": "I'm looking for someone to help me clean my...",
        "image": "assets/images/Rectangle 29.png"
      },


    ]; 

    return Scaffold(
      backgroundColor: MyColors.background.secondary,
      appBar: AppBar(
        title: Text(
          "Saved Tasks",
          style: MyTextStyle.heading.h22.copyWith(
            color: MyColors.text.primary,
          ),
        ),
        centerTitle: true,
        backgroundColor: MyColors.background.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.r)),
        ),
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
      // الحل هنا: تأكدي أن الـ Center لا يحتوي بداخله على Expanded تائهة
      body: savedTasks.isEmpty
          ? Center(
              child: SingleChildScrollView( // أضفنا هذا لضمان عدم حدوث Overflow في الشاشات الصغيرة
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/svg/Objects.svg'),
                    SizedBox(height: 24.h),
                    Text(
                      "No saved tasks yet.",
                      style: MyTextStyle.heading.h32.copyWith(
                        fontWeight: FontWeight.bold,
                        color: MyColors.text.primary,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: Text(
                        "You haven't saved any tasks yet.\nSave tasks to easily find and review them later.",
                        textAlign: TextAlign.center,
                        style: MyTextStyle.body.body2.copyWith(
                          color: MyColors.text.secondary,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : GridView.builder(
              padding: EdgeInsets.all(24.r),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
              ),
              itemCount: savedTasks.length,
              itemBuilder: (context, index) {
                final task = savedTasks[index];
                return SavedTaskCard(
                  imagePath: task["image"]!,
                  title: task["title"]!,
                  points: task["points"]!,
                  description: task["description"]!,
                );
              },
            ),
    );
  }
}

