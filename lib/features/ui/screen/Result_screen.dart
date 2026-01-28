import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/data/Profile_Model.dart';
import 'package:tascom/features/data/Task_Model.dart';
import 'package:tascom/features/ui/widgets/Filter_Search.dart';
import 'package:tascom/features/ui/widgets/Profile_card.dart';
import 'package:tascom/features/ui/widgets/searchBar.dart';

class ResultSearch extends StatefulWidget {
  const ResultSearch({
    super.key,
    required this.initialQuery,
    required this.initialType,
  });

  final String initialQuery;
  final String initialType;

  @override
  State<ResultSearch> createState() => _ResultSearchState();
}

class _ResultSearchState extends State<ResultSearch> {
  final FocusNode _focusNode = FocusNode();
  List<Object> _searchResults = [];
  late TextEditingController searchController;
  late TextEditingController dropdownController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController(text: widget.initialQuery);
    dropdownController = TextEditingController(text: widget.initialType);

    searchController.addListener(_updateSearchResults);
    dropdownController.addListener(_updateSearchResults);

    _updateSearchResults();
  }

  void _updateSearchResults() {
    if (!mounted) return;
    final query = searchController.text.trim();
    setState(() {
      _searchResults = dropdownController.text == 'Tasks'
          ? getTasks(query)
          : getProfiles(query);
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(() {
      if (!mounted) return;
      setState(() {});
    });
    _focusNode.dispose();

    searchController.removeListener(_updateSearchResults);
    dropdownController.removeListener(_updateSearchResults);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 80.h,
        title: Text(
          'Search',
          style: MyTextStyle.heading.h21.copyWith(color: MyColors.text.primary),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  builder: (context) => const FilterSearch(),
                );
              },
              icon: Image.asset(
                'assets/images/68-setting-1-2.png',
                height: 24.h,
                width: 24.w,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Searchbar(
                focusNode: _focusNode,
                searchController: searchController,
                selectedItem: dropdownController,
                onChanged: (value) {},
                onSubmitted: (value) {
                  if (value.isEmpty) return;
                },
              ),

              SizedBox(height: 20.h),
              Expanded(
                child: _searchResults.isEmpty
                    ? _buildEmptyState()
                    : _buildResultsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/images/nullimage.svg',
            width: 121.w,
            height: 118.h,
          ),
          const SizedBox(height: 16),
          Text(
            'No results found',
            style: MyTextStyle.body.body1.copyWith(
              color: MyColors.text.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'We can’t find any item matching your search',
            style: MyTextStyle.body.body2.copyWith(
              color: MyColors.text.secondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildResultsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top results',
          style: MyTextStyle.heading.h32.copyWith(color: MyColors.text.primary),
        ),
        SizedBox(height: 20.h),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: _searchResults.length,
            separatorBuilder: (_, __) => SizedBox(height: 24.h),
            itemBuilder: (context, index) {
              final item = _searchResults[index];
              print('${dropdownController.text} aaa');
              return dropdownController.text == 'Tasks'
                  ? Text(
                      (item as TaskModel).title,
                      style: MyTextStyle.body.body1.copyWith(
                        color: MyColors.text.primary,
                      ),
                    )
                  : ProfileCard(profile: item as ProfileModel);
            },
          ),
        ),
      ],
    );
  }

  // ====== MOCK DATA ======
  List<TaskModel> ListTask = [
    TaskModel(
      id: '1',
      title: 'Dog Walking',
      description: 'Walk my dog in the park',
      status: 'Open',
      category: 'Pet Care',
      imageUrl: 'assets/images/dog_walking.jpg',
    ),
    TaskModel(
      id: '2',
      title: 'Pet Sitting',
      description: 'Take care of my cat',
      status: 'In Progress',
      category: 'Pet Care',
      imageUrl: 'assets/images/pet_sitting.jpg',
    ),
    TaskModel(
      id: '3',
      title: 'Furniture Repair',
      description: 'Fix a broken chair leg',
      status: 'Completed',
      category: 'Repairs',
      imageUrl: 'assets/images/furniture_repair.jpg',
    ),
    TaskModel(
      id: '4',
      title: 'Teaching a Skill',
      description: 'Teach guitar',
      status: 'Open',
      category: 'Tutoring',
      imageUrl: 'assets/images/teaching_skill.jpg',
    ),
  ];

  List<TaskModel> getTasks(String query) {
    if (query.isEmpty) return ListTask;
    return ListTask.where(
      (task) =>
          task.title.toLowerCase().contains(query.toLowerCase()) ||
          task.category.toLowerCase().contains(query.toLowerCase()) ||
          task.description.toLowerCase().contains(query.toLowerCase()) ||
          task.status.toLowerCase().contains(query.toLowerCase()),
    ).toList();
  }

  static List<ProfileModel> ListProfile = [
    ProfileModel(
      id: '1',
      name: 'Tala Ahmad',
      imageUrl: 'assets/images/profile.jpg',
      rating: 4.2,
      country: 'Palestine',
      city: 'Nablus',
      description: 'I enjoy helping others and exchanging tasks fairly.',
      skills: [
        'Animal Care',
        'Pet Sitting',
        'Dog Walking',
        'Feeding & Basic Care',
      ],
    ),
    ProfileModel(
      id: '2',
      name: 'Asmaa Ahmad',
      imageUrl: 'assets/images/profile.jpg',
      rating: 4.2,
      country: 'Palestine',
      city: 'Nablus',
      description: 'I enjoy helping others and exchanging tasks fairly.',
      skills: [
        'Animal Care',
        'Pet Sitting',
        'Dog Walking',
        'Feeding & Basic Care',
      ],
    ),
    ProfileModel(
      id: '3',
      name: 'Ali Ahmad',
      imageUrl: 'assets/images/profile.jpg',
      rating: 4.2,
      country: 'Palestine',
      city: 'Nablus',
      description: 'I enjoy helping others and exchanging tasks fairly.',
      skills: [
        'Animal Care',
        'Pet Sitting',
        'Dog Walking',
        'Feeding & Basic Care',
      ],
    ),
    ProfileModel(
      id: '4',
      name: 'Tala Al-Farsi',
      imageUrl: 'assets/images/profile.jpg',
      rating: 4.2,
      country: 'Palestine',
      city: 'Nablus',
      description: 'I enjoy helping others and exchanging tasks fairly.',
      skills: [
        'Animal Care',
        'Pet Sitting',
        'Dog Walking',
        'Feeding & Basic Care',
      ],
    ),
    ProfileModel(
      id: '5',
      name: 'Omar Al-Farsi',
      imageUrl: 'assets/images/profile.jpg',
      rating: 4.2,
      country: 'Palestine',
      city: 'Nablus',
      description: 'I enjoy helping others and exchanging tasks fairly.',
      skills: [
        'Animal Care',
        'Pet Sitting',
        'Dog Walking',
        'Feeding & Basic Care',
      ],
    ),
    ProfileModel(
      id: '6',
      name: 'Sara Al-Farsi',
      imageUrl: 'assets/images/profile.jpg',
      rating: 4.2,
      country: 'Palestine',
      city: 'Nablus',
      description: 'I enjoy helping others and exchanging tasks fairly.',
      skills: [
        'Animal Care',
        'Pet Sitting',
        'Dog Walking',
        'Feeding & Basic Care',
      ],
    ),
    ProfileModel(
      id: '7',
      name: 'Lina Al-Farsi',
      imageUrl: 'assets/images/profile.jpg',
      rating: 4.2,
      country: 'Palestine',
      city: 'Nablus',
      description: 'I enjoy helping others and exchanging tasks fairly.',
      skills: [
        'Animal Care',
        'Pet Sitting',
        'Dog Walking',
        'Feeding & Basic Care',
      ],
    ),
  ];

  List<ProfileModel> getProfiles(String query) {
    if (query.isEmpty) return ListProfile;
    return ListProfile.where(
      (profile) => profile.name.toLowerCase().contains(query.toLowerCase()),
    ).toList();
  }
}
