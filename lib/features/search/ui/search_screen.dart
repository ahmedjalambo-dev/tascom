import 'package:flutter/material.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/widgets/my_search_field.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/search/data/search_filter_result.dart';
import 'package:tascom/features/search/data/search_mock_data.dart';
import 'package:tascom/features/search/ui/widgets/quick_filter_chips.dart';
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

  final Set<String> _selectedQuickFilters = {};
  late List<RecentSearchItem> _recentSearches;
  SearchFilterResult? _currentFilter;

  @override
  void initState() {
    super.initState();
    _recentSearches = List.from(mockRecentSearches);
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchController.dispose();
    _selectedItemController.dispose();
    super.dispose();
  }

  void _toggleQuickFilter(String filter) {
    setState(() {
      if (_selectedQuickFilters.contains(filter)) {
        _selectedQuickFilters.remove(filter);
      } else {
        _selectedQuickFilters.add(filter);
      }
    });
  }

  void _clearRecentSearches() {
    setState(() => _recentSearches.clear());
  }

  Future<void> _openFilterBottomSheet() async {
    final result = await showSearchFilterBottomSheet(
      context: context,
      initialFilter: _currentFilter,
    );
    if (result != null) {
      setState(() => _currentFilter = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchAppBar(onFilterTap: _openFilterBottomSheet),
            const VerticalSpace(24),
            MySearchField(
              focusNode: _searchFocusNode,
              searchController: _searchController,
              selectedItem: _selectedItemController,
              onChanged: (value) {},
              onSubmitted: (value) {},
            ),
            const VerticalSpace(16),
            QuickFilterChips(
              selectedFilters: _selectedQuickFilters,
              onFilterTap: _toggleQuickFilter,
            ),
            const VerticalSpace(24),
            if (_recentSearches.isNotEmpty)
              RecentSearchesSection(
                recentSearches: _recentSearches,
                onClearTap: _clearRecentSearches,
                onItemTap: (item) {
                  _searchController.text = item.text;
                },
              ),
            const VerticalSpace(100),
          ],
        ),
      ),
    );
  }
}
