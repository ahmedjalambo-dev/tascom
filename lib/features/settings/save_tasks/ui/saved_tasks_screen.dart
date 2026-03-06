import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/extentions/extentions.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/core/storage/session_manager.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_app_bar.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/get_tasks/data/models/task_response_mapper.dart';
import 'package:tascom/features/save_task/cubit/save_task_cubit.dart';
import 'package:tascom/features/save_task/ui/save_task_listener.dart';
import 'package:tascom/features/settings/save_tasks/cubit/saved_tasks_cubit.dart';
import 'package:tascom/features/settings/save_tasks/cubit/saved_tasks_state.dart';
import 'package:tascom/features/settings/save_tasks/ui/widgets/saved_task_card.dart';

class SavedTasksScreen extends StatelessWidget {
  const SavedTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SaveTaskListener(
      onSuccess: (data) {
        if (data.isSaved == false) {
          context.read<SavedTasksCubit>().removeTask(data.taskId ?? '');
        }
      },
      child: Scaffold(
        backgroundColor: MyColors.background.primary,
        body: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: BlocBuilder<SavedTasksCubit, SavedTasksState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    success: (tasks, creators, locationNames) {
                      if (tasks.isEmpty) {
                        return Center(
                          child: Text(
                            'No saved tasks',
                            style: MyTextStyles.body.body1.copyWith(
                              color: MyColors.text.secondary,
                            ),
                          ),
                        );
                      }
                      return GridView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.w,
                          mainAxisSpacing: 12.h,
                          childAspectRatio: 0.65,
                        ),
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          final task = tasks[index];
                          return SavedTaskCard(
                            task: task,
                            onTap: () {
                              final currentUserId =
                                  SessionManager.instance.currentUserId;
                              final taskModel = task.toTaskModel(
                                creators: creators,
                                locationNames: locationNames,
                                currentUserId: currentUserId,
                              );
                              Navigator.pushNamed(
                                context,
                                MyRoutes.taskDetails,
                                arguments: taskModel,
                              );
                            },
                            onUnsaveTap: () {
                              context
                                  .read<SaveTaskCubit>()
                                  .saveTask(task.id);
                            },
                          );
                        },
                      );
                    },
                    error: (error) => Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              error.message ?? 'Something went wrong',
                              style: MyTextStyles.body.body1.copyWith(
                                color: MyColors.states.error,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const VerticalSpace(16),
                            TextButton(
                              onPressed: () => context
                                  .read<SavedTasksCubit>()
                                  .getSavedTasks(),
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
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
          'Saved Tasks',
          style: MyTextStyles.heading.h22.copyWith(
            color: MyColors.text.primary,
          ),
        ),
      ),
    );
  }
}
