import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';

class PostsFilterDropdown extends StatefulWidget {
  final List<String> items;
  final String? initialValue;
  final ValueChanged<String>? onChanged;

  const PostsFilterDropdown({
    super.key,
    required this.items,
    this.initialValue,
    this.onChanged,
  });

  @override
  State<PostsFilterDropdown> createState() => _PostsFilterDropdownState();
}

class _PostsFilterDropdownState extends State<PostsFilterDropdown> {
  late String _selectedValue;
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue ?? widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      borderRadius: BorderRadius.circular(12.r),

      onSelected: (value) {
        setState(() {
          _selectedValue = value;
          _isOpen = false;
        });
        widget.onChanged?.call(value);
      },
      onOpened: () {
        setState(() => _isOpen = true);
      },
      onCanceled: () {
        setState(() => _isOpen = false);
      },
      offset: Offset(0, 40.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      color: MyColors.background.primary,
      itemBuilder: (context) {
        return widget.items.map((item) {
          final isSelected = item == _selectedValue;
          return PopupMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: MyTextStyles.label.label2.copyWith(
                color: isSelected
                    ? MyColors.brand.purple
                    : MyColors.text.primary,
              ),
            ),
          );
        }).toList();
      },
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
              _selectedValue,
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
