import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tascom/features/save_task/cubit/save_task_cubit.dart';
import 'package:tascom/features/save_task/cubit/save_task_state.dart';
import 'package:tascom/features/save_task/data/models/save_task_response.dart';

class SaveTaskListener extends BlocListener<SaveTaskCubit, SaveTaskState> {
  SaveTaskListener({
    super.key,
    void Function(SaveTaskData data)? onSuccess,
    required super.child,
  }) : super(
          listener: (context, state) {
            state.maybeWhen(
              success: (data) {
                onSuccess?.call(data);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      data.isSaved == true ? 'Task saved' : 'Task unsaved',
                    ),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              error: (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error.message ?? 'Failed to save task'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              orElse: () {},
            );
          },
        );
}
