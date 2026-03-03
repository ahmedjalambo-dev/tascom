import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';

class FilterRangeSliderSection extends StatelessWidget {
  final double min;
  final double max;
  final RangeValues values;
  final ValueChanged<RangeValues> onChanged;
  final String Function(double) formatLabel;

  const FilterRangeSliderSection({
    super.key,
    required this.min,
    required this.max,
    required this.values,
    required this.onChanged,
    required this.formatLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: MyColors.brand.purple,
            inactiveTrackColor: MyColors.border.border,
            thumbColor: Colors.white,
            overlayColor: MyColors.brand.purple.withValues(alpha: 0.1),
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.r),
            trackHeight: 3.h,
          ),
          child: RangeSlider(
            values: values,
            min: min,
            max: max,
            onChanged: onChanged,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formatLabel(values.start),
                style: MyTextStyles.label.label1.copyWith(
                  color: MyColors.text.secondary,
                ),
              ),
              Text(
                formatLabel(values.end),
                style: MyTextStyles.label.label1.copyWith(
                  color: MyColors.text.secondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
