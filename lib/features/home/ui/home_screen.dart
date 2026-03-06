import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/dialogs/claim_confirmation_dialog.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/claim_task/cubit/claim_task_cubit.dart';
import 'package:tascom/features/claim_task/cubit/claim_task_state.dart';
import 'package:tascom/features/save_task/cubit/save_task_cubit.dart';
import 'package:tascom/features/save_task/ui/save_task_listener.dart';
import 'package:tascom/features/like_task/cubit/like_task_cubit.dart';
import 'package:tascom/features/like_task/ui/like_task_listener.dart';
import 'package:tascom/features/get_tasks/cubit/get_tasks_cubit.dart';
import 'package:tascom/features/get_tasks/cubit/get_tasks_state.dart';
import 'package:tascom/features/get_tasks/data/models/all_tasks_response.dart';
import 'package:tascom/features/get_tasks/data/models/task_response_mapper.dart';
import 'package:tascom/features/home/data/filter_categories_data.dart';
import 'package:tascom/features/user/data/models/user_model.dart';
import 'package:tascom/core/storage/session_manager.dart';
import 'package:tascom/features/home/ui/widgets/categoies/category_filter_list.dart';
import 'package:tascom/features/home/ui/widgets/home_app_bar.dart';
import 'package:tascom/features/home/ui/widgets/posts/priority_filter_dropdown.dart';
import 'package:tascom/features/home/data/models/task_priority.dart';
import 'package:tascom/core/widgets/my_filter_dropdown.dart';
import 'package:tascom/features/home/ui/widgets/posts/task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showHeaders = true;
  double _lastScrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final currentOffset = _scrollController.offset;
    final delta = currentOffset - _lastScrollOffset;

    // Show headers when at the top
    if (currentOffset <= 0) {
      if (!_showHeaders) {
        setState(() => _showHeaders = true);
      }
    }
    // Hide headers when scrolling down
    else if (delta > 5 && _showHeaders) {
      setState(() => _showHeaders = false);
    }
    // Show headers when scrolling up
    else if (delta < -5 && !_showHeaders) {
      setState(() => _showHeaders = true);
    }

    _lastScrollOffset = currentOffset;

    // Pagination logic
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      final cubit = context.read<GetTasksCubit>();
      if (cubit.hasMorePages) {
        cubit.loadMore();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.primary,
      body: MultiBlocListener(
        listeners: [
          BlocListener<ClaimTaskCubit, ClaimTaskState>(
            listener: (context, claimState) {
              claimState.when(
                initial: () {},
                loading: (_) {},
                success: (_) {
                  context.read<GetTasksCubit>().getAllTasks();
                },
                error: (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(error.message ?? 'Failed to claim task'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
              );
            },
          ),
          SaveTaskListener(
            onSuccess: (data) {
              context.read<GetTasksCubit>().toggleSaved(
                data.taskId ?? '',
                data.isSaved ?? false,
              );
            },
            child: const SizedBox.shrink(),
          ),
          LikeTaskListener(
            onSuccess: (data) {
              final currentUserId =
                  SessionManager.instance.currentUserId;
              final isLiked = data.likes.any(
                (like) =>
                    like.userId == currentUserId &&
                    like.likeStatus == true,
              );
              context.read<GetTasksCubit>().toggleLiked(
                data.id ?? '',
                isLiked,
                data.numOfLikes ?? 0,
              );
            },
            child: const SizedBox.shrink(),
          ),
        ],
        child: BlocBuilder<GetTasksCubit, GetTasksState>(
          builder: (context, state) {
            return Column(
              children: [
                // Fixed header section with animation
                AnimatedSlide(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  offset: _showHeaders ? Offset.zero : const Offset(0, -1),
                  child: const HomeAppBar(),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: _showHeaders ? 12.h : 0,
                ),

                // Categories Filter with animation
                AnimatedSlide(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  offset: _showHeaders ? Offset.zero : const Offset(0, -1),
                  child: CategoryFilterList(
                    categories: filterCategories,
                    selectedId: _getSelectedCategoryId(
                      context.read<GetTasksCubit>().currentCategory,
                    ),
                    onCategoryTap: (category) {
                      context.read<GetTasksCubit>().filterByCategory(
                        category.apiCategory,
                      );
                    },
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: _showHeaders ? 12.h : 0,
                ),

                // Sort & Priority Filters with animation
                AnimatedSlide(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  offset: _showHeaders ? Offset.zero : const Offset(0, -1),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        Text('Sort by', style: MyTextStyles.label.label1),
                        HorizontalSpace(4.w),
                        MyFilterDropdown<String>(
                          items: const ['rating', 'distance', 'score'],
                          selectedValue: context
                              .read<GetTasksCubit>()
                              .currentSortBy,
                          allOptionLabel: 'None',
                          labelBuilder: (item) =>
                              item[0].toUpperCase() + item.substring(1),
                          onChanged: (value) {
                            context.read<GetTasksCubit>().setSortBy(value);
                          },
                        ),
                        const Spacer(),
                        Text('Priority', style: MyTextStyles.label.label1),
                        HorizontalSpace(4.w),
                        PriorityFilterDropdown(
                          selectedPriorities: context
                              .read<GetTasksCubit>()
                              .selectedPriorities
                              .map(TaskPriority.fromApiValue)
                              .toList(),
                          onChanged: (priorities) {
                            context.read<GetTasksCubit>().setPriorities(
                              priorities.map((p) => p.toApiValue).toList(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: _showHeaders ? 12.h : 0,
                ),

                // Scrollable task list
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () =>
                        context.read<GetTasksCubit>().getAllTasks(),
                    child: CustomScrollView(
                      controller: _scrollController,
                      slivers: [
                        _buildTaskList(state),
                        const SliverToBoxAdapter(child: VerticalSpace(100)),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTaskList(GetTasksState state) {
    return state.when(
      initial: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
      loading: () => const SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: CircularProgressIndicator(),
          ),
        ),
      ),
      success: (response, creators, locationNames) {
        return _buildTaskSliver(
          response: response,
          creators: creators,
          locationNames: locationNames,
        );
      },
      loadingMore: (currentData, creators, locationNames) {
        return _buildTaskSliver(
          response: currentData,
          creators: creators,
          locationNames: locationNames,
          showLoadingMore: true,
        );
      },
      error: (error) => SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
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
                  onPressed: () => context.read<GetTasksCubit>().getAllTasks(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTaskSliver({
    required AllTasksResponse response,
    required Map<String, UserModel> creators,
    required Map<String, String> locationNames,
    bool showLoadingMore = false,
  }) {
    final currentUserId = SessionManager.instance.currentUserId;
    final tasks = response.data
        .map(
          (t) => t.toTaskModel(
            creators: creators,
            locationNames: locationNames,
            currentUserId: currentUserId,
          ),
        )
        .toList();

    if (tasks.isEmpty) {
      return SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Text(
              'No tasks available',
              style: MyTextStyles.body.body1.copyWith(
                color: MyColors.text.secondary,
              ),
            ),
          ),
        ),
      );
    }

    final itemCount = showLoadingMore ? tasks.length + 1 : tasks.length;

    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      sliver: SliverList.separated(
        itemCount: itemCount,
        separatorBuilder: (context, index) => const VerticalSpace(16),
        itemBuilder: (context, index) {
          if (showLoadingMore && index == tasks.length) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: CircularProgressIndicator(),
              ),
            );
          }
          final taskModel = tasks[index];
          final claimState = context.watch<ClaimTaskCubit>().state;
          final isClaimLoading = claimState.maybeWhen(
            loading: (taskId) => taskId == taskModel.id,
            orElse: () => false,
          );
          return TaskCard(
            taskModel: taskModel,
            isClaimLoading: isClaimLoading,
            onTap: () {
              Navigator.pushNamed(
                context,
                MyRoutes.taskDetails,
                arguments: taskModel,
              );
            },
            onClaimTap: taskModel.isClaimed
                ? null
                : () => _handleClaimTask(taskModel.id),
            onLikeTap: () {
              context.read<LikeTaskCubit>().likeTask(taskModel.id);
            },
            onSaveTap: () {
              context.read<SaveTaskCubit>().saveTask(taskModel.id);
            },
            maxLines: 4,
          );
        },
      ),
    );
  }

  String _getSelectedCategoryId(String? apiCategory) {
    if (apiCategory == null) return 'all';
    final match = filterCategories
        .where((c) => c.apiCategory == apiCategory)
        .firstOrNull;
    return match?.id ?? 'all';
  }

  Future<void> _handleClaimTask(String taskId) async {
    final confirmed = await showClaimConfirmationDialog(context);
    if (confirmed == true && mounted) {
      context.read<ClaimTaskCubit>().claimTask(taskId);
    }
  }
}
