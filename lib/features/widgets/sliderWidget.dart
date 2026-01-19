import 'package:flutter/material.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tascom/features/cubit/Range_Silder_Cubit.dart';

class SliderExample extends StatelessWidget {
  const SliderExample({super.key, required this.min, required this.max});

  final double min;
  final double max;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RangeSliderCubit(min: min, max: max),
      child: _SliderView(min: min, max: max),
    );
  }
}

class _SliderView extends StatelessWidget {
  const _SliderView({required this.min, required this.max});

  final double min;
  final double max;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RangeSliderCubit, RangeValues>(
      builder: (context, rangeValues) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ' ${rangeValues.start.round()} ',
                  style: MyTextStyle.caption.captionNotes.copyWith(
                    color: MyColors.text.secondary,
                  ),
                ),
                Text(
                  ' ${rangeValues.end.round()}',
                  style: MyTextStyle.caption.captionNotes.copyWith(
                    color: MyColors.text.secondary,
                  ),
                ),
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(
                context,
              ).copyWith(thumbColor: MyColors.icons.icon),
              child: RangeSlider(
                values: rangeValues,
                min: min,
                max: max,
                divisions: (max - min).round(),
                activeColor: MyColors.icons.icon,
                inactiveColor: MyColors.icons.icon,
                onChanged: (newRange) {
                  context.read<RangeSliderCubit>().updateRange(newRange);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
