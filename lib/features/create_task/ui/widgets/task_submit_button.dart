import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tascom/core/widgets/my_button.dart';
import 'package:tascom/features/create_task/cubit/create_task_cubit.dart';
import 'package:tascom/features/create_task/cubit/create_task_state.dart';

class TaskSubmitButton extends StatelessWidget {
  const TaskSubmitButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTaskCubit, CreateTaskState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );
        return MyButton(
          text: isLoading ? 'Posting...' : 'Post',
          onPressed: isLoading ? null : onPressed,
        );
      },
    );
  }
}
