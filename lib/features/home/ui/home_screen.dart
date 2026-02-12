import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/dialogs/claim_confirmation_dialog.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/home/data/filter_categories_data.dart';
import 'package:tascom/features/home/data/models/task_model.dart';
import 'package:tascom/features/home/data/task_mock_data.dart';
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
  String _selectedCategoryId = 'all';
  late List<TaskModel> _tasks;

  @override
  void initState() {
    super.initState();
    _tasks = List.from(mockTaskPosts);
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchController.dispose();
    _selectedItemController.dispose();
    super.dispose();
  }

  Future<void> _handleClaimTask(int index) async {
    final confirmed = await showClaimConfirmationDialog(context);
    if (confirmed == true) {
      setState(() {
        _tasks[index] = _tasks[index].copyWith(isClaimed: true);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.primary,
      body: SingleChildScrollView(
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
                    items: const ['All', 'Most Recent', 'Top Commented'],
                    onChanged: (value) {
                      // Handle filter change
                    },
                  ),
                ],
              ),
            ),
            const VerticalSpace(16),

            // Task Posts List
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: _tasks.length,
              separatorBuilder: (context, index) => const VerticalSpace(16),
              itemBuilder: (context, index) {
                final taskModel = _tasks[index];
                return TaskCard(
                  taskModel: taskModel,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      MyRoutes.taskDetails,
                      arguments: taskModel,
                    );
                  },
                  onClaimTap: taskModel.isClaimed
                      ? null
                      : () => _handleClaimTask(index),
                );
              },
            ),
            const VerticalSpace(100),
          ],
        ),
      ),
    );
  }
}
