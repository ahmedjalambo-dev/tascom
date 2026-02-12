import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';

class _DropdownItem<T> {
  final T? value;
  final bool isAllOption;

  const _DropdownItem(this.value, {this.isAllOption = false});
}

class MyFilterDropdown<T> extends StatefulWidget {
  final List<T> items;
  final T? selectedValue;
  final ValueChanged<T?>? onChanged;
  final String Function(T) labelBuilder;
  final String? allOptionLabel;
  final double? borderRadius;

  const MyFilterDropdown({
    super.key,
    required this.items,
    required this.labelBuilder,
    this.selectedValue,
    this.onChanged,
    this.allOptionLabel,
    this.borderRadius,
  });

  @override
  State<MyFilterDropdown<T>> createState() => _MyFilterDropdownState<T>();
}

class _MyFilterDropdownState<T> extends State<MyFilterDropdown<T>> {
  bool _isOpen = false;

  String get _displayLabel {
    if (widget.selectedValue == null) {
      return widget.allOptionLabel ?? '';
    }
    return widget.labelBuilder(widget.selectedValue as T);
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = widget.borderRadius ?? 12.r;

    return PopupMenuButton<_DropdownItem<T>>(
      onSelected: (item) {
        setState(() => _isOpen = false);
        widget.onChanged?.call(item.value);
      },
      onOpened: () => setState(() => _isOpen = true),
      onCanceled: () => setState(() => _isOpen = false),
      offset: Offset(0, 40.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      color: MyColors.background.primary,
      itemBuilder: (context) => _buildMenuItems(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: MyColors.background.primary,
          borderRadius: BorderRadius.circular(borderRadius),
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

  List<PopupMenuItem<_DropdownItem<T>>> _buildMenuItems() {
    final items = <PopupMenuItem<_DropdownItem<T>>>[];

    if (widget.allOptionLabel != null) {
      items.add(
        _buildMenuItem(
          const _DropdownItem(null, isAllOption: true),
          widget.allOptionLabel!,
        ),
      );
    }

    for (final item in widget.items) {
      items.add(_buildMenuItem(_DropdownItem(item), widget.labelBuilder(item)));
    }

    return items;
  }

  PopupMenuItem<_DropdownItem<T>> _buildMenuItem(
    _DropdownItem<T> item,
    String label,
  ) {
    final isSelected = item.isAllOption
        ? widget.selectedValue == null
        : widget.selectedValue == item.value;
    return PopupMenuItem<_DropdownItem<T>>(
      value: item,
      child: Text(
        label,
        style: MyTextStyles.label.label2.copyWith(
          color: isSelected ? MyColors.brand.purple : MyColors.text.primary,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
    );
  }
}
