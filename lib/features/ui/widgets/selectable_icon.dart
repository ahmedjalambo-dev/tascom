import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tascom/core/themes/my_colors.dart';

class SelectableIcon extends StatelessWidget {
  final int value;
  final int selectedValue;
  final ValueChanged<int> onSelected;

  const SelectableIcon({
    super.key,
    required this.value,
    required this.selectedValue,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == selectedValue;
    return GestureDetector(
      onTap: () => onSelected(value),
      child: Container(
        width: 16.w,
        height: 16.h,
        decoration: BoxDecoration(
          color: isSelected ? MyColors.brand.purple : Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? MyColors.brand.purple : MyColors.border.border,
            width: 1.5,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: SvgPicture.asset(
              'assets/images/Vector.svg',
              width: 20, // icon size
              height: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
