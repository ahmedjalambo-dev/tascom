import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tascom/features/like_task/cubit/like_task_cubit.dart';
import 'package:tascom/features/like_task/cubit/like_task_state.dart';
import 'package:tascom/features/like_task/data/models/like_task_response.dart';

class LikeTaskListener extends BlocListener<LikeTaskCubit, LikeTaskState> {
  LikeTaskListener({
    super.key,
    void Function(LikeTaskData data)? onSuccess,
    required super.child,
  }) : super(
         listener: (context, state) {
           state.maybeWhen(
             success: (data) {
               onSuccess?.call(data);
             },
             error: (error) {
               ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                   content: Text(error.message ?? 'Failed to like task'),
                   behavior: SnackBarBehavior.floating,
                 ),
               );
             },
             orElse: () {},
           );
         },
       );
}
