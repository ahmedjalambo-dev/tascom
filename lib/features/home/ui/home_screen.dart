import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/dialogs/cancel_claim_confirmation_dialog.dart';
import 'package:tascom/core/widgets/dialogs/claim_confirmation_dialog.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/home/cubit/home_cubit.dart';
import 'package:tascom/features/home/cubit/home_state.dart';
import 'package:tascom/features/home/data/filter_categories_data.dart';
import 'package:tascom/features/home/data/models/all_tasks_response.dart';
import 'package:tascom/features/home/data/models/task_response_mapper.dart';
import 'package:tascom/features/user/data/models/user_model.dart';
import 'package:tascom/core/storage/session_manager.dart';
import 'package:tascom/features/home/ui/widgets/categoies/category_filter_list.dart';
import 'package:tascom/features/home/ui/widgets/home_app_bar.dart';
import 'package:tascom/features/home/ui/widgets/posts/posts_filter_dropdown.dart';
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
  String _selectedCategoryId = 'all';

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
      final cubit = context.read<HomeCubit>();
      if (cubit.hasMorePages) {
        cubit.loadMore();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.primary,
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeClaimError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error.message ?? 'Failed to claim task'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          } else if (state is HomeCancelClaimError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    state.error.message ?? 'Failed to cancel claim'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () => context.read<HomeCubit>().getAllTasks(),
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
                      selectedId: _selectedCategoryId,
                      onCategoryTap: (category) {
                        setState(() => _selectedCategoryId = category.id);
                      },
                    ),
                    const VerticalSpace(24),

                    // Posts Section Header
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        children: [
                          Text(
                            'Posts',
                            style: MyTextStyles.heading.h22.copyWith(
                              color: MyColors.text.primary,
                            ),
                          ),
                          const Spacer(),
                          PostsFilterDropdown(
                            items: const [
                              'All',
                              'Most Recent',
                              'Top Commented',
                            ],
                            onChanged: (value) {
                              // Handle filter change
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
    );
  }

  Widget _buildTaskList(HomeState state) {
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
      claimLoading: (taskId, currentData, creators, locationNames) {
        return _buildTaskSliver(
          response: currentData,
          creators: creators,
          locationNames: locationNames,
          claimLoadingTaskId: taskId,
        );
      },
      claimError: (error, currentData, creators, locationNames) {
        return _buildTaskSliver(
          response: currentData,
          creators: creators,
          locationNames: locationNames,
        );
      },
      cancelClaimLoading: (taskId, currentData, creators, locationNames) {
        return _buildTaskSliver(
          response: currentData,
          creators: creators,
          locationNames: locationNames,
          claimLoadingTaskId: taskId,
        );
      },
      cancelClaimError: (error, currentData, creators, locationNames) {
        return _buildTaskSliver(
          response: currentData,
          creators: creators,
          locationNames: locationNames,
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
                  onPressed: () => context.read<HomeCubit>().getAllTasks(),
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
    String? claimLoadingTaskId,
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
          return TaskCard(
            taskModel: taskModel,
            isClaimLoading: claimLoadingTaskId == taskModel.id,
            onTap: () {
              Navigator.pushNamed(
                context,
                MyRoutes.taskDetails,
                arguments: taskModel,
              );
            },
            onClaimTap: taskModel.isClaimed
                ? () => _handleCancelClaim(
                      claimId: taskModel.currentUserClaimId!,
                      taskId: taskModel.id,
                    )
                : () => _handleClaimTask(taskModel.id),
          );
        },
      ),
    );
  }

  Future<void> _handleClaimTask(String taskId) async {
    final confirmed = await showClaimConfirmationDialog(context);
    if (confirmed == true && mounted) {
      context.read<HomeCubit>().claimTask(taskId);
    }
  }

  Future<void> _handleCancelClaim({
    required String claimId,
    required String taskId,
  }) async {
    final confirmed = await showCancelClaimConfirmationDialog(context);
    if (confirmed == true && mounted) {
      context.read<HomeCubit>().cancelClaim(
            claimId: claimId,
            taskId: taskId,
          );
    }
  }
}
