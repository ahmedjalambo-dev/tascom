import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/dialogs/claim_confirmation_dialog.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/home/cubit/home_cubit.dart';
import 'package:tascom/features/home/cubit/home_state.dart';
import 'package:tascom/features/home/data/filter_categories_data.dart';
import 'package:tascom/features/home/data/models/task_response_mapper.dart';
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
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return CustomScrollView(
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
              const SliverToBoxAdapter(
                child: VerticalSpace(100),
              ),
            ],
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
        final tasks = response.data
            .map((t) => t.toTaskModel(
                  creators: creators,
                  locationNames: locationNames,
                ))
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

        return SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          sliver: SliverList.separated(
            itemCount: tasks.length,
            separatorBuilder: (context, index) => const VerticalSpace(16),
            itemBuilder: (context, index) {
              final taskModel = tasks[index];
              return TaskCard(
                taskModel: taskModel,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    MyRoutes.taskDetails,
                    arguments: taskModel,
                  );
                },
                onClaimTap:
                    taskModel.isClaimed ? null : () => _handleClaimTask(index),
              );
            },
          ),
        );
      },
      loadingMore: (currentData, creators, locationNames) {
        final tasks = currentData.data
            .map((t) => t.toTaskModel(
                  creators: creators,
                  locationNames: locationNames,
                ))
            .toList();

        return SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          sliver: SliverList.separated(
            itemCount: tasks.length + 1,
            separatorBuilder: (context, index) => const VerticalSpace(16),
            itemBuilder: (context, index) {
              if (index == tasks.length) {
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
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    MyRoutes.taskDetails,
                    arguments: taskModel,
                  );
                },
                onClaimTap:
                    taskModel.isClaimed ? null : () => _handleClaimTask(index),
              );
            },
          ),
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
                  onPressed: () =>
                      context.read<HomeCubit>().getAllTasks(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleClaimTask(int index) async {
    final confirmed = await showClaimConfirmationDialog(context);
    if (confirmed == true) {
      // TODO: Implement claim task API call
    }
  }
}
