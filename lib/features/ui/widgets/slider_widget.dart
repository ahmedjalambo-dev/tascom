import 'package:flutter/material.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class SliderView extends StatefulWidget {
  const SliderView({super.key, required this.min, required this.max});

  final double min;
  final double max;

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  late RangeValues _range;

  @override
  void initState() {
    super.initState();
    _range = RangeValues(widget.min, widget.max);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${_range.start.round()}',
              style: MyTextStyle.caption.captionNotes.copyWith(
                color: MyColors.text.secondary,
              ),
            ),
            Text(
              '${_range.end.round()}',
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
            values: _range,
            min: widget.min,
            max: widget.max,
            divisions: (widget.max - widget.min).round(),
            activeColor: MyColors.icons.icon,
            inactiveColor: MyColors.icons.icon,
            onChanged: (newRange) {
              setState(() {
                _range = newRange;
              });
            },
          ),
        ),
      ],
    );
  }
}
