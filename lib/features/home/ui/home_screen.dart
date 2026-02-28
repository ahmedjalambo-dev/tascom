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
import 'package:tascom/core/widgets/my_search_field.dart';
import 'package:tascom/features/home/ui/widgets/posts/task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _selectedItemController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchController.dispose();
    _selectedItemController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
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
      body: BlocListener<ClaimTaskCubit, ClaimTaskState>(
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
        child: BlocBuilder<GetTasksCubit, GetTasksState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () => context.read<GetTasksCubit>().getAllTasks(),
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const HomeAppBar(),
                        const VerticalSpace(24),
                        MySearchField(
                          focusNode: _searchFocusNode,
                          searchController: _searchController,
                          selectedItem: _selectedItemController,
                          onChanged: (value) {
                            // Handle search text change
                          },
                          onSubmitted: (value) {
                            // Handle search submission
                          },
                        ),
                        const VerticalSpace(24),

                        // Categories Filter
                        CategoryFilterList(
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
                        const VerticalSpace(24),

                        // Sort & Priority Filters
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            children: [
                              MyFilterDropdown<String>(
                                items: const ['rating', 'distance', 'score'],
                                selectedValue: context
                                    .read<GetTasksCubit>()
                                    .currentSortBy,
                                // allOptionLabel: 'Sort By',
                                
                                labelBuilder: (item) =>
                                    item[0].toUpperCase() + item.substring(1),
                                onChanged: (value) {
                                  context.read<GetTasksCubit>().setSortBy(
                                    value,
                                  );
                                },
                              ),
                              const Spacer(),
                              PriorityFilterDropdown(
                                selectedPriorities: context
                                    .read<GetTasksCubit>()
                                    .selectedPriorities
                                    .map(TaskPriority.fromApiValue)
                                    .toList(),
                                onChanged: (priorities) {
                                  context.read<GetTasksCubit>().setPriorities(
                                    priorities
                                        .map((p) => p.toApiValue)
                                        .toList(),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const VerticalSpace(16),
                      ],
                    ),
                  ),

                  // Task Posts List
                  _buildTaskList(state),

                  // Bottom spacing
                  const SliverToBoxAdapter(child: VerticalSpace(100)),
                ],
              ),
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
