import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:radio_group_v2/widgets/view_models/radio_group_controller.dart';
import 'package:tascom/core/routes/my_router.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/data/Profile_Model.dart';
import 'package:tascom/features/data/Task_Model.dart';
import 'package:tascom/features/ui/screen/Result_screen.dart';
import 'package:tascom/features/ui/widgets/CustomDropdown.dart';
import 'package:tascom/features/ui/widgets/Filter_Search.dart';
import 'package:tascom/features/ui/widgets/filterChip.dart';
import 'package:tascom/features/ui/widgets/recentWidget.dart';
import 'package:tascom/features/ui/widgets/result_widget.dart';
import 'package:tascom/features/ui/widgets/searchBar.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _dropdownValue = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dropdownValue.text = 'Tasks';
    _focusNode.addListener(() {
      if (!mounted) return;
      setState(() {});
    });
    _searchController.addListener(_updateSearchResults);

    _dropdownValue.addListener(_updateSearchResults);
  }

  void _updateSearchResults() {
    if (!mounted) return;
    final query = _searchController.text.trim();
    setState(() {
      _searchResults = _dropdownValue.text == 'Tasks'
          ? getTasks(query)
          : getProfiles(query);
    });
  }

  RadioGroupController myController = RadioGroupController();
  List<Object> _searchResults = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
                searchController: _searchController,
                selectedItem: _dropdownValue,
                onChanged: (value) {
                  setState(() {
                    if (_dropdownValue.text == 'Tasks') {
                      _searchResults = ListTask.where(
                        (task) => task.title.toLowerCase().contains(
                          value.toLowerCase(),
                        ),
                      ).toList();
                    } else {
                      _searchResults = ListProfile.where(
                        (profile) => profile.name.toLowerCase().contains(
                          value.toLowerCase(),
                        ),
                      ).toList();
                    }
                  });
                },
                onSubmitted: (value) {
                  if (value.isEmpty) return;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultSearch(
                        initialQuery: _searchController.text,
                        initialType: _dropdownValue.text,
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 15),
              Wrap(
                spacing: 1,
                runSpacing: 8,
                children: [
                  const Filterchip(label: 'Near me'),
                  _dropdownValue.text == 'Tasks'
                      ? const Filterchip(label: 'Available today')
                      : const SizedBox.shrink(),
                  const Filterchip(label: 'Top rated'),
                  _dropdownValue.text == 'Tasks'
                      ? const Filterchip(label: 'Quick tasks')
                      : const SizedBox.shrink(),
                ],
              ),

              _searchResults.isEmpty
                  ? const SizedBox.shrink()
                  : SizedBox(height: 25.h),
              _searchResults.isEmpty
                  ? const SizedBox.shrink()
                  : Text(
                      'Results',
                      style: MyTextStyle.heading.h32.copyWith(
                        color: MyColors.text.primary,
                      ),
                    ),
              _searchResults.isEmpty
                  ? const SizedBox.shrink()
                  : SizedBox(height: 24.h),
              _searchResults.isEmpty
                  ? const SizedBox.shrink()
                  : SizedBox(
                      height: 160.h,
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: min(_searchResults.length, 4),
                        itemBuilder: (context, index) {
                          final result = _searchResults[index];
                          return _dropdownValue.text == 'Tasks'
                              ? ResultWidget(
                                  titleText: (result as TaskModel).title,
                                  icon: 'assets/images/TaskIcon.png',
                                )
                              : ResultWidget(
                                  titleText: (result as ProfileModel).name,
                                  icon: 'assets/images/profile.jpg',
                                );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 12.h);
                        },
                      ),
                    ),

              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent',
                    style: MyTextStyle.heading.h32.copyWith(
                      color: MyColors.text.primary,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Clear',
                      style: MyTextStyle.label.label1.copyWith(
                        color: MyColors.text.third,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: min(RecentList.length, 4),
                itemBuilder: (context, index) {
                  final result = RecentList[index];
                  return Recentwidget(
                    titleText: result.title,
                    icon: result.imageUrl,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 12.h);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<ProfileModel> ListProfile = [
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
    TaskModel(
      id: '5',
      title: 'Shipping to an address',
      description: 'Ship a package to a specific address',
      status: 'Open',
      category: 'Transportation',
      imageUrl: 'assets/images/Transportation.svg',
    ),
  ];

  List<Object> getTasks(query) {
    return ListTask.where((task) {
      return task.title.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  List<Object> getProfiles(query) {
    return ListProfile.where((profile) {
      return profile.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  List<TaskModel> RecentList = [
    TaskModel(
      id: '2',
      title: 'Pet Sitting',
      description: 'Take care of my cat',
      status: 'In Progress',
      category: 'Pet Care',
      imageUrl: 'assets/images/PetCare2.svg',
    ),
    TaskModel(
      id: '3',
      title: 'Furniture Repair',
      description: 'Fix a broken chair leg',
      status: 'Completed',
      category: 'Repairs',
      imageUrl: 'assets/images/Repairs.svg',
    ),
    TaskModel(
      id: '5',
      title: 'Shipping to an address',
      description: 'Ship a package to a specific address',
      status: 'Open',
      category: 'Transportation',
      imageUrl: 'assets/images/Transportation.svg',
    ),
    TaskModel(
      id: '4',
      title: 'Teaching a Skill',
      description: 'Teach guitar',
      status: 'Open',
      category: 'Tutoring',
      imageUrl: 'assets/images/Tutoring.svg',
    ),
  ];
}
