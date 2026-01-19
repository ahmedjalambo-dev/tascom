import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/widgets/selectable_icon.dart';

class SelectableIconGroup extends StatefulWidget {
  const SelectableIconGroup({super.key});

  @override
  State<SelectableIconGroup> createState() => _SelectableIconGroupState();
}

class _SelectableIconGroupState extends State<SelectableIconGroup> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            SelectableIcon(
              value: 1,
              selectedValue: selected,
              onSelected: (val) {
                setState(() {
                  selected = val;
                });
              },
            ),
            SizedBox(width: 10.0),
            Text(
              'High',
              style: MyTextStyle.body.body2.copyWith(
                color: MyColors.text.primary,
              ),
            ),
          ],
        ),
        SizedBox(height: 15.h),
        Row(
          children: [
            SelectableIcon(
              value: 2,
              selectedValue: selected,
              onSelected: (val) {
                setState(() {
                  selected = val;
                });
              },
            ),
            SizedBox(width: 10.0),
            Text(
              'Medium',
              style: MyTextStyle.body.body2.copyWith(
                color: MyColors.text.primary,
              ),
            ),
          ],
        ),
        SizedBox(height: 15.h),
        Row(
          children: [
            SelectableIcon(
              value: 3,
              selectedValue: selected,
              onSelected: (val) {
                setState(() {
                  selected = val;
                });
              },
            ),
            SizedBox(width: 10.0),
            Text(
              'Low',
              style: MyTextStyle.body.body2.copyWith(
                color: MyColors.text.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
