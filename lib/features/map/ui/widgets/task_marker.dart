import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/my_colors.dart';

class TaskMarker extends StatelessWidget {
  final int points;
  final bool isSelected;
  final VoidCallback onTap;

  const TaskMarker({
    super.key,
    required this.points,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: MyColors.brand.purple,
          shape: BoxShape.circle,
          border: isSelected
              ? Border.all(color: Colors.white, width: 3.w)
              : null,
        ),
        child: Center(
          child: Text(
            '$points',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
