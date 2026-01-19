import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:radio_group_v2/widgets/view_models/radio_group_controller.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/widgets/CustomDropdown.dart';
import 'package:tascom/features/widgets/Filter_Search.dart';
import 'package:tascom/features/widgets/filterChip.dart';
import 'package:tascom/features/widgets/recentWidget.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
    _searchController.addListener(() {
      setState(() {});
    });
  }

  RadioGroupController myController = RadioGroupController();
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
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              TextField(
                focusNode: _focusNode,

                controller: _searchController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 6.h, //  controls height
                    horizontal: 16,
                  ),
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(255, 6, 6, 6),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/images/search2.png',
                      width: 16.w,
                      height: 16.h,
                      fit: BoxFit.contain,
                    ),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1.5,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: const BorderSide(
                      color: Color(0xFF6B39F4),
                      width: 2,
                    ),
                  ),

                  suffixIcon: IntrinsicHeight(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _searchController.text.isEmpty
                            ? Image.asset(
                                'assets/images/star.png',
                                height: 25,
                                width: 25,
                              )
                            : IconButton(
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Color.fromARGB(255, 69, 36, 126),
                                ),
                                onPressed: () {
                                  _searchController.clear();
                                  setState(() {});
                                },
                              ),

                        const VerticalDivider(
                          color: Color.fromARGB(255, 225, 224, 224),
                          thickness: 0.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 3),
                          child: SizedBox(
                            height: 35.h,
                            width: 100.w,
                            child: const CustomDropdownW(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.only(top: 10),
                height: 40,
                child: _focusNode.hasFocus
                    ? Text(
                        'AI-powered search that understands your needs',
                        style: TextStyle(
                          color: MyColors.brand.purple,

                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    : null,
              ),
              const SizedBox(height: 15),
              const Wrap(
                spacing: 1,
                runSpacing: 1,
                children: [
                  Filterchip(label: 'Near me'),
                  Filterchip(label: 'Available today'),
                  Filterchip(label: 'Top rated'),
                  Filterchip(label: 'Quick tasks'),
                ],
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
              const Column(
                children: [
                  Recentwidget(
                    titleText: 'Pet Care',
                    icon: 'assets/images/PetCare2.svg',
                  ),
                  Recentwidget(
                    titleText: 'Furniture Repair ',
                    icon: 'assets/images/Repairs.svg',
                  ),
                  Recentwidget(
                    titleText: 'Shipping to an address',
                    icon: 'assets/images/Transportation.svg',
                  ),
                  Recentwidget(
                    titleText: 'Teaching a skill',
                    icon: 'assets/images/Tutoring.svg',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
