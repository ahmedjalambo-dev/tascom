import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';

class MyDropDown extends StatefulWidget {
  const MyDropDown({
    super.key,
    required this.items,
    required this.controller,
    required this.onChanged,
  });

  final List<String> items;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  bool _isOpen = false;

  String get _selectedValue => widget.controller.text.isEmpty
      ? widget.items.first
      : widget.controller.text;

  @override
  void initState() {
    super.initState();
    if (widget.controller.text.isEmpty && widget.items.isNotEmpty) {
      widget.controller.text = widget.items.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onOpened: () => setState(() => _isOpen = true),
      onCanceled: () => setState(() => _isOpen = false),
      onSelected: (value) {
        setState(() => _isOpen = false);
        widget.onChanged(value);
      },
      offset: Offset(0, 40.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      color: MyColors.background.primary,
      itemBuilder: (context) => widget.items
          .map(
            (item) => PopupMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: MyTextStyles.label.label2.copyWith(
                  color: item == _selectedValue
                      ? MyColors.brand.purple
                      : MyColors.text.primary,
                  fontWeight: item == _selectedValue
                      ? FontWeight.w600
                      : FontWeight.w400,
                ),
              ),
            ),
          )
          .toList(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _selectedValue,
              style: MyTextStyles.label.label1.copyWith(
                color: MyColors.brand.purple,
              ),
            ),
            const HorizontalSpace(4),
            SvgPicture.asset(
              _isOpen ? MyIcons.arrowUp : MyIcons.arrowDown,
              width: 16.w,
              height: 16.h,
              colorFilter: ColorFilter.mode(
                MyColors.icons.icon,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
