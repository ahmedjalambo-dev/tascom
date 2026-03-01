import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/home/data/models/task_priority.dart';

class PriorityFilterDropdown extends StatefulWidget {
  final List<TaskPriority> selectedPriorities;
  final ValueChanged<List<TaskPriority>> onChanged;

  const PriorityFilterDropdown({
    super.key,
    required this.selectedPriorities,
    required this.onChanged,
  });

  @override
  State<PriorityFilterDropdown> createState() => _PriorityFilterDropdownState();
}

class _PriorityFilterDropdownState extends State<PriorityFilterDropdown> {
  bool _isOpen = false;
  late Set<TaskPriority> _selected;

  @override
  void initState() {
    super.initState();
    _selected = Set.from(widget.selectedPriorities);
  }

  @override
  void didUpdateWidget(PriorityFilterDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedPriorities != widget.selectedPriorities) {
      _selected = Set.from(widget.selectedPriorities);
    }
  }

  String get _displayLabel {
    if (_selected.isEmpty) return 'None';
    if (_selected.length == 1) return _selected.first.displayName;
    return '${_selected.length} selected';
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<TaskPriority>(
      onSelected: (priority) {
        setState(() {
          if (_selected.contains(priority)) {
            _selected.remove(priority);
          } else {
            _selected.add(priority);
          }
        });
        widget.onChanged(_selected.toList());
      },
      onOpened: () => setState(() => _isOpen = true),
      onCanceled: () => setState(() => _isOpen = false),
      offset: Offset(0, 40.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      borderRadius: BorderRadius.circular(12.r),

      color: MyColors.background.primary,
      itemBuilder: (context) => TaskPriority.values.map((priority) {
        final isSelected = _selected.contains(priority);
        return CheckedPopupMenuItem<TaskPriority>(
          value: priority,
          checked: isSelected,
          child: Text(
            priority.displayName,
            style: MyTextStyles.label.label2.copyWith(
              color: isSelected ? MyColors.brand.purple : MyColors.text.primary,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        );
      }).toList(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: MyColors.background.primary,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: MyColors.border.postBorder, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _displayLabel,
              style: MyTextStyles.label.label1.copyWith(
                color: MyColors.text.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            HorizontalSpace(4.w),
            SvgPicture.asset(
              _isOpen ? MyIcons.arrowUp : MyIcons.arrowDown,
              width: 16.w,
              height: 16.w,
              colorFilter: ColorFilter.mode(
                MyColors.text.primary,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
