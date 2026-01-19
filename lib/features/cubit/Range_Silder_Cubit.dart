import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class RangeSliderCubit extends Cubit<RangeValues> {
  RangeSliderCubit({required double min, required double max})
    : super(RangeValues(min, max));

  void updateRange(RangeValues newRange) => emit(newRange);
}
