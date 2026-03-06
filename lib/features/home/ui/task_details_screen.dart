import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/di/injection.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/widgets/dialogs/claim_confirmation_dialog.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/core/storage/shared_pref_helper.dart';
import 'package:tascom/features/create_comment/cubit/create_comment_cubit.dart';
import 'package:tascom/features/create_comment/cubit/create_comment_state.dart';
import 'package:tascom/features/create_comment/data/models/create_comment_request.dart';
import 'package:tascom/features/create_comment/ui/comment_input_bar.dart';
import 'package:tascom/features/delete_comment/cubit/delete_comment_cubit.dart';
import 'package:tascom/features/delete_comment/cubit/delete_comment_state.dart';
import 'package:tascom/features/edit_comment/cubit/edit_comment_cubit.dart';
import 'package:tascom/features/edit_comment/cubit/edit_comment_state.dart';
import 'package:tascom/features/edit_comment/data/models/edit_comment_request.dart';
import 'package:tascom/features/get_comments/cubit/get_comments_cubit.dart';
import 'package:tascom/features/get_comments/data/models/comment_response.dart';
import 'package:tascom/features/save_task/cubit/save_task_cubit.dart';
import 'package:tascom/features/save_task/ui/save_task_listener.dart';
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
  final TextEditingController _commentController = TextEditingController();
  String? _replyingToCommentId;
  String? _replyingToName;
  String? _editingCommentId;

  @override
  void initState() {
    super.initState();
    _taskModel = widget.taskModel;
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _handleClaimTask() async {
    final confirmed = await showClaimConfirmationDialog(context);
    if (confirmed == true) {
      setState(() {
        _taskModel = _taskModel.copyWith(isClaimed: true);
      });
    }
  }

  void _handleReplyTap(String commentId, String userName) {
    setState(() {
      _replyingToCommentId = commentId;
      _replyingToName = userName;
    });
  }

  void _cancelReply() {
    setState(() {
      _replyingToCommentId = null;
      _replyingToName = null;
    });
  }

  void _handleEditTap(String commentId, String content) {
    setState(() {
      _editingCommentId = commentId;
      _replyingToCommentId = null;
      _replyingToName = null;
    });
    _commentController.text = content;
  }

  void _cancelEdit() {
    setState(() {
      _editingCommentId = null;
    });
    _commentController.clear();
  }

  void _sendComment(BuildContext context, int taskId) {
    final content = _commentController.text.trim();
    if (content.isEmpty) return;

    if (_editingCommentId != null) {
      final id = int.tryParse(_editingCommentId!);
      if (id != null) {
        context.read<EditCommentCubit>().editComment(
              id,
              EditCommentRequest(content: content),
            );
      }
      return;
    }

    final request = CreateCommentRequest(
      taskId: taskId,
      content: content,
      replyId: _replyingToCommentId != null
          ? int.tryParse(_replyingToCommentId!)
          : null,
    );

    context.read<CreateCommentCubit>().createComment(request);
  }

  void _handleCreateCommentState(
    BuildContext context,
    CreateCommentState state,
  ) {
    state.maybeWhen(
      success: (commentModel) {
        final enrichedComment = commentModel.copyWith(
          user: CommentUserModel(
            id: SharedPrefHelper.getUserId(),
            name: SharedPrefHelper.getUserName(),
          ),
        );

        context.read<GetCommentsCubit>().addComment(
          enrichedComment,
          parentId: _replyingToCommentId,
        );

        _commentController.clear();
        _cancelReply();
        context.read<CreateCommentCubit>().reset();

        setState(() {
          _taskModel = _taskModel.copyWith(
            commentCount: _taskModel.commentCount + 1,
          );
        });
      },
      error: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message ?? 'Failed to post comment'),
            backgroundColor: MyColors.status.cancelled,
          ),
        );
        context.read<CreateCommentCubit>().reset();
      },
      orElse: () {},
    );
  }

  void _handleEditCommentState(
    BuildContext context,
    EditCommentState state,
  ) {
    state.maybeWhen(
      success: (commentModel) {
        context.read<GetCommentsCubit>().updateComment(
              commentModel.id ?? _editingCommentId ?? '',
              commentModel.content ?? '',
            );

        _commentController.clear();
        _cancelEdit();
        context.read<EditCommentCubit>().reset();
      },
      error: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message ?? 'Failed to edit comment'),
            backgroundColor: MyColors.status.cancelled,
          ),
        );
        context.read<EditCommentCubit>().reset();
      },
      orElse: () {},
    );
  }

  void _handleDeleteCommentState(
    BuildContext context,
    DeleteCommentState state,
  ) {
    state.maybeWhen(
      success: (commentId) {
        context.read<GetCommentsCubit>().removeComment(commentId);
        context.read<DeleteCommentCubit>().reset();

        setState(() {
          _taskModel = _taskModel.copyWith(
            commentCount: (_taskModel.commentCount - 1).clamp(
              0,
              _taskModel.commentCount,
            ),
          );
        });
      },
      error: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message ?? 'Failed to delete comment'),
            backgroundColor: MyColors.status.cancelled,
          ),
        );
        context.read<DeleteCommentCubit>().reset();
      },
      orElse: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final taskId = int.tryParse(_taskModel.id) ?? 0;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<GetCommentsCubit>()..emitGetTaskComments(taskId),
        ),
        BlocProvider(create: (_) => getIt<CreateCommentCubit>()),
        BlocProvider(create: (_) => getIt<DeleteCommentCubit>()),
        BlocProvider(create: (_) => getIt<EditCommentCubit>()),
        BlocProvider(create: (_) => getIt<SaveTaskCubit>()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<CreateCommentCubit, CreateCommentState>(
            listener: _handleCreateCommentState,
          ),
          BlocListener<DeleteCommentCubit, DeleteCommentState>(
            listener: _handleDeleteCommentState,
          ),
          BlocListener<EditCommentCubit, EditCommentState>(
            listener: _handleEditCommentState,
          ),
          SaveTaskListener(
            onSuccess: (data) {
              setState(() {
                _taskModel = _taskModel.copyWith(
                  isSaved: data.isSaved ?? false,
                );
              });
            },
            child: const SizedBox.shrink(),
          ),
        ],
        child: Scaffold(
          backgroundColor: MyColors.background.primary,
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const TaskDetailsAppBar(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          children: [
                            const VerticalSpace(16),
                            Builder(
                              builder: (context) => TaskCard(
                                taskModel: _taskModel,
                                onClaimTap: _taskModel.isClaimed
                                    ? null
                                    : _handleClaimTask,
                                onSaveTap: () => context
                                    .read<SaveTaskCubit>()
                                    .saveTask(_taskModel.id),
                                maxLines: 10,
                              ),
                            ),
                            const VerticalSpace(24),
                            Builder(
                              builder: (context) => CommentsSection(
                                taskId: taskId,
                                totalCount: _taskModel.commentCount,
                                onReplyTap: _handleReplyTap,
                                onDeleteTap: (commentId) {
                                  final id = int.tryParse(commentId);
                                  if (id != null) {
                                    context
                                        .read<DeleteCommentCubit>()
                                        .deleteComment(id);
                                  }
                                },
                                onEditTap: _handleEditTap,
                              ),
                            ),
                            const VerticalSpace(32),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Builder(
                builder: (context) {
                  final isCreateLoading = context
                      .watch<CreateCommentCubit>()
                      .state
                      .maybeWhen(loading: () => true, orElse: () => false);
                  final isEditLoading = context
                      .watch<EditCommentCubit>()
                      .state
                      .maybeWhen(loading: () => true, orElse: () => false);
                  return CommentInputBar(
                    controller: _commentController,
                    isLoading: isCreateLoading || isEditLoading,
                    replyingToName: _replyingToName,
                    onCancelReply: _cancelReply,
                    isEditing: _editingCommentId != null,
                    onCancelEdit: _cancelEdit,
                    onSend: () => _sendComment(context, taskId),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
