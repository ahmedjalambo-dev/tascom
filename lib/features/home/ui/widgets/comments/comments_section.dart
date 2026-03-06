import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/home/data/models/comment.dart';
import 'package:tascom/features/home/ui/widgets/comments/comment_tile.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tascom/core/storage/shared_pref_helper.dart';
import '../../../../get_comments/cubit/get_comments_cubit.dart';
import '../../../../get_comments/cubit/get_comments_state.dart';
import '../../../../get_comments/data/models/comment_response.dart';

class CommentsSection extends StatelessWidget {
  final int taskId;
  final int totalCount;
  final VoidCallback? onFilterTap;
  final void Function(String commentId, String userName)? onReplyTap;
  final void Function(String commentId)? onDeleteTap;
  final void Function(String commentId, String content)? onEditTap;

  const CommentsSection({
    super.key,
    required this.taskId,
    required this.totalCount,
    this.onFilterTap,
    this.onReplyTap,
    this.onDeleteTap,
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Comments ($totalCount)',
          style: MyTextStyles.heading.h22.copyWith(
            color: MyColors.text.primary,
          ),
        ),
        BlocBuilder<GetCommentsCubit, GetCommentsState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) => Center(child: Text(message)),
              success: (models) {
                final comments = _mapModelsToComments(models);
                if (comments.isEmpty) {
                  return const Center(child: Text('No comments yet.'));
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: comments.length,
                  separatorBuilder: (context, index) => const VerticalSpace(16),
                  itemBuilder: (context, index) {
                    final comment = comments[index];
                    return Column(
                      children: [
                        CommentTile(
                          comment: comment,
                          onReplyTap: () => onReplyTap?.call(
                            models[index].id ?? '',
                            comment.userName,
                          ),
                          onDeleteTap: comment.isAuthor
                              ? () => onDeleteTap?.call(comment.id)
                              : null,
                          onEditTap: comment.isAuthor
                              ? () =>
                                    onEditTap?.call(comment.id, comment.content)
                              : null,
                        ),
                        if (comment.replies.isNotEmpty) ...[
                          const VerticalSpace(16),
                          ...comment.replies.asMap().entries.map((entry) {
                            final reply = entry.value;
                            final isLast =
                                entry.key == comment.replies.length - 1;
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: isLast ? 0 : 16.h,
                              ),
                              child: CommentTile(
                                comment: reply,
                                isNested: true,
                                onReplyTap: () => onReplyTap?.call(
                                  models[index].id ?? '',
                                  reply.userName,
                                ),
                                onDeleteTap: reply.isAuthor
                                    ? () => onDeleteTap?.call(reply.id)
                                    : null,
                                onEditTap: reply.isAuthor
                                    ? () => onEditTap?.call(
                                        reply.id,
                                        reply.content,
                                      )
                                    : null,
                              ),
                            );
                          }),
                        ],
                      ],
                    );
                  },
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ],
    );
  }

  List<Comment> _mapModelsToComments(List<CommentModel> models) {
    final currentUserId = SharedPrefHelper.getUserId();
    return models.map((model) {
      return Comment(
        id: model.id ?? '',
        userName: model.user?.name ?? 'Unknown',
        userAvatar: model.user?.avatar,
        createdAt: DateTime.tryParse(model.createdAt ?? '') ?? DateTime.now(),
        content: model.content ?? '',
        isAuthor: model.user?.id == currentUserId,
        replies: _mapModelsToComments(model.replies),
      );
    }).toList();
  }
}
