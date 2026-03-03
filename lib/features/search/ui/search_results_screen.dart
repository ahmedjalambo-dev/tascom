import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_app_bar.dart';
import 'package:tascom/core/widgets/my_search_field.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/search/cubit/search_cubit.dart';
import 'package:tascom/features/search/cubit/search_state.dart';
import 'package:tascom/features/search/data/models/search_task_data.dart';
import 'package:tascom/features/search/data/models/search_task_mapper.dart';
import 'package:tascom/features/search/ui/widgets/people_card.dart';
import 'package:tascom/features/search/ui/widgets/search_task_card.dart';
import 'package:tascom/features/search/ui/widgets/quick_filter_chips.dart';
import 'package:tascom/features/home/ui/task_details_screen.dart';
import 'package:tascom/features/search/ui/widgets/search_filter_bottom_sheet.dart';
import 'package:tascom/core/extentions/extentions.dart';
import 'package:tascom/core/routes/my_routes.dart';

class SearchResultsScreen extends StatefulWidget {
  final String initialQuery;
  final String initialType;

  const SearchResultsScreen({
    super.key,
    required this.initialQuery,
    required this.initialType,
  });

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  final FocusNode _searchFocusNode = FocusNode();
  late final TextEditingController _searchController;
  late final TextEditingController _selectedItemController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.initialQuery);
    _selectedItemController = TextEditingController(text: widget.initialType);
    _scrollController.addListener(_onScroll);
    _selectedItemController.addListener(_onTypeChanged);
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
      context.read<SearchCubit>().loadMore();
    }
  }

  void _onTypeChanged() {
    final type = _selectedItemController.text;
    if (type.isNotEmpty) {
      context.read<SearchCubit>().setSearchType(type);
    }
  }

  void _onSearch(String query) {
    context.read<SearchCubit>().search(query);
  }

  void _onQuickFilterTap(String filter) {
    context.read<SearchCubit>().setQuickFilter(filter);
  }

  Future<void> _openFilterBottomSheet() async {
    final cubit = context.read<SearchCubit>();
    final result = await showSearchFilterBottomSheet(
      context: context,
      initialFilter: cubit.currentFilter,
    );
    if (result != null) {
      cubit.applyFilter(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.primary,
      body: Column(
        children: [
          MyAppBar(
            leading: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 20.w,
                  color: MyColors.icons.icon,
                ),
              ),
            ),
            title: Text(
              'Search',
              style: MyTextStyles.heading.h22.copyWith(
                color: MyColors.text.primary,
              ),
            ),
            trailing: [
              GestureDetector(
                onTap: _openFilterBottomSheet,
                child: SvgPicture.asset(
                  MyIcons.filterStroke,
                  width: 24.w,
                  height: 24.h,
                  colorFilter: ColorFilter.mode(
                    MyColors.icons.icon,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
          const VerticalSpace(16),
          MySearchField(
            focusNode: _searchFocusNode,
            searchController: _searchController,
            selectedItem: _selectedItemController,
            onChanged: (_) {},
            onSubmitted: _onSearch,
          ),
          const VerticalSpace(16),
          BlocBuilder<SearchCubit, SearchState>(
            buildWhen: (previous, current) =>
                previous.runtimeType != current.runtimeType,
            builder: (context, state) {
              final cubit = context.read<SearchCubit>();
              return QuickFilterChips(
                selectedFilter: cubit.modeToLabel(cubit.activeMode),
                onFilterTap: _onQuickFilterTap,
              );
            },
          ),
          const VerticalSpace(8),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                return switch (state) {
                  SearchLoading() => _buildLoading(),
                  SearchTasksSuccess() => _buildTaskResults(state),
                  SearchPeopleSuccess() => _buildPeopleResults(state),
                  SearchLoadingMore() => _buildLoadingMore(state),
                  SearchEmpty() => _buildEmpty(),
                  SearchError() => _buildError(state),
                  _ => _buildLoading(),
                };
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildTaskResults(SearchTasksSuccess state) {
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.only(top: 8.h, bottom: 100.h),
      itemCount: state.tasks.length,
      itemBuilder: (context, index) {
        final taskModel = state.tasks[index].toTaskModel();
        return SearchTaskCard(
          taskModel: taskModel,
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => TaskDetailsScreen(taskModel: taskModel),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPeopleResults(SearchPeopleSuccess state) {
    final cubit = context.read<SearchCubit>();
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.only(top: 8.h, bottom: 100.h),
      itemCount: state.people.length,
      itemBuilder: (context, index) {
        final person = state.people[index];
        return PeopleCard(
          person: person,
          resolvedLocation: cubit.resolvedLocations[person.id],
          onTap: () => context.pushNamed(
            MyRoutes.helperDetails,
            arguments: person.id,
          ),
        );
      },
    );
  }

  Widget _buildLoadingMore(SearchLoadingMore state) {
    final cubit = context.read<SearchCubit>();
    final isTaskSearch = cubit.searchType == 'tasks';

    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.only(top: 8.h, bottom: 100.h),
      itemCount: state.currentItems.length + 1,
      itemBuilder: (context, index) {
        if (index == state.currentItems.length) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: const Center(child: CircularProgressIndicator()),
          );
        }
        final item = state.currentItems[index];
        if (isTaskSearch) {
          final taskModel = (item as SearchTaskData).toTaskModel();
          return SearchTaskCard(
            taskModel: taskModel,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => TaskDetailsScreen(taskModel: taskModel),
              ),
            ),
          );
        }
        return PeopleCard(
          person: item,
          resolvedLocation: cubit.resolvedLocations[item.id],
          onTap: () => context.pushNamed(
            MyRoutes.helperDetails,
            arguments: item.id,
          ),
        );
      },
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off_rounded,
            size: 64.w,
            color: MyColors.text.third,
          ),
          const VerticalSpace(16),
          Text(
            'No results found',
            style: MyTextStyles.body.body1.copyWith(color: MyColors.text.third),
          ),
          const VerticalSpace(8),
          Text(
            'Try adjusting your search or filters',
            style: MyTextStyles.body.body2.copyWith(color: MyColors.text.third),
          ),
        ],
      ),
    );
  }

  Widget _buildError(SearchError state) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 64.w,
              color: MyColors.text.third,
            ),
            const VerticalSpace(16),
            Text(
              state.error.message ?? 'Something went wrong',
              style: MyTextStyles.body.body1.copyWith(
                color: MyColors.text.secondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
