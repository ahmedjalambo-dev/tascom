import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/home/data/comments_mock_data.dart';
import 'package:tascom/features/home/data/models/task_post.dart';
import 'package:tascom/features/home/ui/widgets/comments_section.dart';
import 'package:tascom/features/home/ui/widgets/task_card/task_card.dart';
import 'package:tascom/features/home/ui/widgets/task_details_app_bar.dart';

class TaskDetailsScreen extends StatelessWidget {
  final TaskPost taskPost;

  const TaskDetailsScreen({
    super.key,
    required this.taskPost,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TaskDetailsAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  const VerticalSpace(16),
                  TaskCard(
                    taskPost: taskPost,
                    onClaimTap: () {
                      // Handle claim task
                    },
                  ),
                  const VerticalSpace(24),
                  CommentsSection(
                    comments: mockComments,
                    totalCount: taskPost.commentCount,
                  ),
                  const VerticalSpace(32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
