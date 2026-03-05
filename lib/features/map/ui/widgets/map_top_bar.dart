import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/my_colors.dart';
import '../../../../core/themes/my_text_styles.dart';

class MapTopBar extends StatelessWidget {
  const MapTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Row(
          children: [
            const Spacer(),
            Text(
              'Map',
              style: MyTextStyles.heading.h22.copyWith(
                color: MyColors.text.primary,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.layers_outlined,
              color: MyColors.text.primary,
              size: 24.w,
            ),
          ],
        ),
      ),
    );
  }
}
