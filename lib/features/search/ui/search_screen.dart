import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_search_field.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/search/cubit/search_cubit.dart';
import 'package:tascom/features/search/ui/search_results_screen.dart';
import 'package:tascom/features/search/ui/widgets/recent_searches_section.dart';
import 'package:tascom/features/search/ui/widgets/search_app_bar.dart';
import 'package:tascom/features/search/ui/widgets/search_filter_bottom_sheet.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _selectedItemController = TextEditingController();

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchController.dispose();
    _selectedItemController.dispose();
    super.dispose();
  }

  void _onSearch(String query) {
    if (query.trim().isEmpty) return;
    final cubit = context.read<SearchCubit>();
    cubit.search(query);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: cubit,
          child: SearchResultsScreen(
            initialQuery: query,
            initialType: _selectedItemController.text.isEmpty
                ? 'Tasks'
                : _selectedItemController.text,
          ),
        ),
      ),
    ).then((_) {
      cubit.resetToInitial();
      setState(() {});
    });
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
          SearchAppBar(onFilterTap: _openFilterBottomSheet),
          const VerticalSpace(24),
          MySearchField(
            focusNode: _searchFocusNode,
            searchController: _searchController,
            selectedItem: _selectedItemController,
            onChanged: (_) {},
            onSubmitted: _onSearch,
          ),
          const VerticalSpace(24),
          Expanded(child: _buildBody()),
        ],
      ),
    );
  }

  Widget _buildBody() {
    final recentSearches = context.read<SearchCubit>().recentSearches;
    if (recentSearches.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_rounded, size: 64.w, color: MyColors.text.third),
            const VerticalSpace(16),
            Text(
              'Search for tasks or people',
              style: MyTextStyles.body.body1.copyWith(
                color: MyColors.text.third,
              ),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: RecentSearchesSection(
        recentSearches: recentSearches,
        onClearTap: () {
          context.read<SearchCubit>().clearRecentSearches();
          setState(() {});
        },
        onItemTap: (query) {
          _searchController.text = query;
          _onSearch(query);
        },
      ),
    );
  }
}
