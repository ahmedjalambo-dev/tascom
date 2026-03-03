import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/widgets/dialogs/claim_confirmation_dialog.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/home/data/models/task_model.dart';
import 'package:tascom/features/home/ui/widgets/comments/comments_section.dart';
import 'package:tascom/features/home/ui/widgets/posts/task_card.dart';
import 'package:tascom/features/home/ui/widgets/task_details_app_bar.dart';

class TaskDetailsScreen extends StatefulWidget {
  final TaskModel taskModel;

  const TaskDetailsScreen({super.key, required this.taskModel});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  late TaskModel _taskModel;

  @override
  void initState() {
    super.initState();
    _taskModel = widget.taskModel;
  }

  Future<void> _handleClaimTask() async {
    final confirmed = await showClaimConfirmationDialog(context);
    if (confirmed == true) {
      setState(() {
        _taskModel = _taskModel.copyWith(isClaimed: true);
      });
    }
  }

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
                    taskModel: _taskModel,
                    onClaimTap: _taskModel.isClaimed ? null : _handleClaimTask,
                  ),
                  const VerticalSpace(24),
                  CommentsSection(
                    taskId: int.tryParse(_taskModel.id) ?? 0,
                    totalCount: _taskModel.commentCount,
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
