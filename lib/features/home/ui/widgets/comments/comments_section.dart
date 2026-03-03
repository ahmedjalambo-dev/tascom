import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/home/data/models/comment.dart';
import 'package:tascom/features/home/ui/widgets/comments/comment_tile.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/injection.dart';
import '../../../../get_comments/cubit/get_comments_cubit.dart';
import '../../../../get_comments/cubit/get_comments_state.dart';
import '../../../../get_comments/data/models/comment_response.dart';

class CommentsSection extends StatelessWidget {
  final int taskId;
  final int totalCount;
  final VoidCallback? onFilterTap;

  const CommentsSection({
    super.key,
    required this.taskId,
    required this.totalCount,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<GetCommentsCubit>()..emitGetTaskComments(taskId),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Comments ($totalCount)',
                style: MyTextStyles.heading.h22.copyWith(
                  color: MyColors.text.primary,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: onFilterTap,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: MyColors.border.border),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'All',
                        style: MyTextStyles.body.body2.copyWith(
                          color: MyColors.text.primary,
                        ),
                      ),
                      const HorizontalSpace(4),
                      SvgPicture.asset(
                        MyIcons.arrowDown,
                        width: 16.w,
                        height: 16.h,
                        colorFilter: ColorFilter.mode(
                          MyColors.icons.icon,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const VerticalSpace(16),
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
                    separatorBuilder: (context, index) =>
                        const VerticalSpace(16),
                    itemBuilder: (context, index) {
                      final comment = comments[index];
                      return Column(
                        children: [
                          CommentTile(comment: comment),
                          if (comment.replies.isNotEmpty) ...[
                            const VerticalSpace(16),
                            ...comment.replies.map(
                              (reply) => Padding(
                                padding: EdgeInsets.only(
                                  bottom: comment.replies.last != reply
                                      ? 16.h
                                      : 0,
                                ),
                                child: CommentTile(
                                  comment: reply,
                                  isNested: true,
                                ),
                              ),
                            ),
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
      ),
    );
  }

  List<Comment> _mapModelsToComments(List<CommentModel> models) {
    return models.map((model) {
      return Comment(
        id: model.id ?? '',
        userName: model.user?.name ?? 'Unknown',
        userAvatar: model.user?.avatar,
        createdAt: DateTime.tryParse(model.createdAt ?? '') ?? DateTime.now(),
        content: model.content ?? '',
        replies: _mapModelsToComments(model.replies),
      );
    }).toList();
  }
}
