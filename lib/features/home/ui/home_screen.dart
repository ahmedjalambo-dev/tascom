import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/features/home/data/mock_data.dart';
import 'package:tascom/features/home/data/models/task_model.dart';
import 'widgets/home_header.dart';
import 'widgets/home_search_bar.dart';
import 'widgets/category_filter_list.dart';
import 'widgets/posts_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategoryId = 'all';
  List<TaskModel> _tasks = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tasks = List.from(mockTasks);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _onCategorySelected(String categoryId) async =>
      setState(() => _selectedCategoryId = categoryId);

  void _onLikeTap(int index) {
    setState(() {
      final task = _tasks[index];
      _tasks[index] = task.copyWith(
        isLiked: !task.isLiked,
        likesCount: task.isLiked ? task.likesCount - 1 : task.likesCount + 1,
      );
    });
  }

  void _onBookmarkTap(int index) {
    setState(() {
      final task = _tasks[index];
      _tasks[index] = task.copyWith(isBookmarked: !task.isBookmarked);
    });
  }

  void _onClaimTap(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Claimed: ${_tasks[index].title}'),
        backgroundColor: MyColors.brand.purple,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.primary,
      body: SafeArea(
        child: Column(
          children: [
            // Header with location and icons
            const HomeHeader(),
            // Search bar with filter
            HomeSearchBar(
              controller: _searchController,
              onChanged: (value) {
                // Search functionality can be added here
              },
            ),
            SizedBox(height: 8.h),
            // Category filter chips
            CategoryFilterList(
              categories: mockCategories,
              selectedCategoryId: _selectedCategoryId,
              onCategorySelected: _onCategorySelected,
            ),
            SizedBox(height: 8.h),
            // Posts section
            Expanded(
              child: PostsSection(
                tasks: _tasks,
                onLikeTap: _onLikeTap,
                onBookmarkTap: _onBookmarkTap,
                onClaimTap: _onClaimTap,
                onTaskTap: (index) {
                  // Navigate to task detail
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
