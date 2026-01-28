import 'package:flutter/material.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/home/widgets/home_app_bar.dart';
import 'package:tascom/features/home/widgets/search_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeAppBar(),
            const VerticalSpace(24),
            SearchField(
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
          ],
        ),
      ),
    );
  }
}
