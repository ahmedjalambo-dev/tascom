import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_app_bar.dart';

class SearchAppBar extends StatelessWidget {
  final VoidCallback onFilterTap;

  const SearchAppBar({super.key, required this.onFilterTap});

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: Center(
        child: Text(
          'Search',
          style: MyTextStyles.heading.h22.copyWith(
            color: MyColors.text.primary,
          ),
        ),
      ),
      trailing: [
        GestureDetector(
          onTap: onFilterTap,
          child: SvgPicture.asset(
            MyIcons.filterStroke,
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(MyColors.icons.icon, BlendMode.srcIn),
          ),
        ),
      ],
    );
  }
}
