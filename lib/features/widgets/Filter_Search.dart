import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/widgets/Category_widget.dart';
import 'package:tascom/features/widgets/selectable_icon_group.dart';
import 'package:tascom/features/widgets/sliderWidget.dart';

class FilterSearch extends StatelessWidget {
  const FilterSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 850,

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Center(
              child: Text(
                "Search Filter",
                style: MyTextStyle.heading.h22.copyWith(
                  color: MyColors.text.primary,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Category',
              style: MyTextStyle.heading.h32.copyWith(
                color: MyColors.text.primary,
              ),
            ),
            SizedBox(height: 16.h),

            CategoryWidget(),
            SizedBox(height: 20),
            Text(
              'Priority',
              style: MyTextStyle.heading.h32.copyWith(
                color: MyColors.text.primary,
              ),
            ),
            const SizedBox(height: 20),
            const SelectableIconGroup(),
            const SizedBox(height: 20),
            Text(
              'Points',
              style: MyTextStyle.heading.h32.copyWith(
                color: MyColors.text.primary,
              ),
            ),
            SizedBox(height: 8.h),
            const SliderExample(min: 0, max: 200),
            Text(
              'Location',
              style: MyTextStyle.heading.h32.copyWith(
                color: MyColors.text.primary,
              ),
            ),
            const SliderExample(min: 0, max: 2000),
            const SizedBox(height: 20),

            SizedBox(
              width: 327.w,
              height: 48.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.brand.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(103),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Apply",
                  style: MyTextStyle.button.primaryButton1.copyWith(
                    color: MyColors.text.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: 327.w,
              height: 48.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 252, 251, 253),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: MyColors.brand.purple),
                    borderRadius: BorderRadius.circular(103),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Reset",
                  style: MyTextStyle.button.primaryButton1.copyWith(
                    color: MyColors.brand.purple,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
