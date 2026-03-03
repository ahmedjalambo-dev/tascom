import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_button.dart';
import 'package:tascom/core/widgets/my_label.dart';
import 'package:tascom/core/widgets/my_outlined_button.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/home/data/models/task_category.dart';
import 'package:tascom/features/home/data/models/task_priority.dart';
import 'package:tascom/features/search/data/search_filter_result.dart';
import 'package:tascom/features/search/ui/widgets/filter_category_wrap.dart';
import 'package:tascom/features/search/ui/widgets/filter_priority_selector.dart';
import 'package:tascom/features/search/ui/widgets/filter_range_slider_section.dart';

Future<SearchFilterResult?> showSearchFilterBottomSheet({
  required BuildContext context,
  SearchFilterResult? initialFilter,
}) {
  return showModalBottomSheet<SearchFilterResult>(
    context: context,
    backgroundColor: Colors.white,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) => FractionallySizedBox(
      heightFactor: 0.75,
      child: SearchFilterBottomSheet(initialFilter: initialFilter),
    ),
  );
}

class SearchFilterBottomSheet extends StatefulWidget {
  final SearchFilterResult? initialFilter;

  const SearchFilterBottomSheet({super.key, this.initialFilter});

  @override
  State<SearchFilterBottomSheet> createState() =>
      _SearchFilterBottomSheetState();
}

class _SearchFilterBottomSheetState extends State<SearchFilterBottomSheet> {
  late Set<TaskCategory> _selectedCategories;
  late TaskPriority? _selectedPriority;
  late RangeValues _pointsRange;
  late RangeValues _locationRange;
  late RangeValues _ratingRange;

  @override
  void initState() {
    super.initState();
    final f = widget.initialFilter;
    _selectedCategories = f?.categories.toSet() ?? {};
    _selectedPriority = f?.priority;
    _pointsRange = f?.pointsRange ?? const RangeValues(0, 200);
    _locationRange = f?.locationRange ?? const RangeValues(300, 2000);
    _ratingRange = f?.ratingRange ?? const RangeValues(1, 5);
  }

  void _apply() {
    Navigator.pop(
      context,
      SearchFilterResult(
        categories: _selectedCategories,
        priority: _selectedPriority,
        pointsRange: _pointsRange,
        locationRange: _locationRange,
        ratingRange: _ratingRange,
      ),
    );
  }

  void _reset() {
    setState(() {
      _selectedCategories = {};
      _selectedPriority = null;
      _pointsRange = const RangeValues(0, 200);
      _locationRange = const RangeValues(300, 2000);
      _ratingRange = const RangeValues(1, 5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Search Filter',
                  style: MyTextStyles.heading.h22.copyWith(
                    color: MyColors.text.primary,
                  ),
                ),
              ),
              const VerticalSpace(24),
              const MyLabel('Category'),
              const VerticalSpace(12),
              FilterCategoryWrap(
                selectedCategories: _selectedCategories,
                onCategoryTap: (category) {
                  setState(() {
                    if (_selectedCategories.contains(category)) {
                      _selectedCategories.remove(category);
                    } else {
                      _selectedCategories.add(category);
                    }
                  });
                },
              ),
              const VerticalSpace(24),
              const MyLabel('Priority'),
              const VerticalSpace(12),
              FilterPrioritySelector(
                selectedPriority: _selectedPriority,
                onChanged: (priority) {
                  setState(() => _selectedPriority = priority);
                },
              ),
              const VerticalSpace(24),
              const MyLabel('Points'),
              const VerticalSpace(12),
              FilterRangeSliderSection(
                min: 0,
                max: 200,
                values: _pointsRange,
                onChanged: (values) {
                  setState(() => _pointsRange = values);
                },
                formatLabel: (v) => v.toInt().toString(),
              ),
              const VerticalSpace(24),
              const MyLabel('Location'),
              const VerticalSpace(12),
              FilterRangeSliderSection(
                min: 300,
                max: 2000,
                values: _locationRange,
                onChanged: (values) {
                  setState(() => _locationRange = values);
                },
                formatLabel: (v) => '${v.toInt()}m',
              ),
              const VerticalSpace(24),
              const MyLabel('Rating'),
              const VerticalSpace(12),
              FilterRangeSliderSection(
                min: 1,
                max: 5,
                values: _ratingRange,
                onChanged: (values) {
                  setState(() => _ratingRange = values);
                },
                formatLabel: (v) => v.toStringAsFixed(1),
              ),
              const VerticalSpace(24),
              MyButton(text: 'Apply', onPressed: _apply),
              const VerticalSpace(12),
              MyOutlinedButton(
                text: 'Reset',
                onPressed: _reset,
                borderColor: MyColors.brand.purple,
                textColor: MyColors.brand.purple,
              ),
              const VerticalSpace(16),
            ],
          ),
        ),
      ),
    );
  }
}
