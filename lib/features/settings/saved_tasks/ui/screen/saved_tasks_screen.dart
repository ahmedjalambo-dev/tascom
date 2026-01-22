import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/features/settings/saved_tasks/ui/widgets/saved_task_card.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class SavedTasksScreen extends StatelessWidget {
  const SavedTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data for Saved Tasks matching the design
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
      body: savedTasks.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Container(
                    width: 140.w,
                    height: 140.h,
                    padding: EdgeInsets.all(10.r),
                    
                    decoration: BoxDecoration(
                      color: MyColors.background.cardHover, // Light purple background for icon
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Image.asset('assets/images/Group.png'),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "No saved tasks yet.",
                    style: MyTextStyle.heading.h32.copyWith(
                      fontWeight: FontWeight.bold,
                      color: MyColors.text.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
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
            )
          : GridView.builder(
              padding: const EdgeInsets.all(24.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65, // Adjust ratio for card height
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
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
