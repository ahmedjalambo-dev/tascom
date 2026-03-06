import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/my_colors.dart';
import '../../../../core/themes/my_text_styles.dart';
import '../../cubit/map_cubit.dart';
import '../../cubit/map_state.dart';

class MapErrorView extends StatelessWidget {
  const MapErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      buildWhen: (previous, current) =>
          current is MapError || previous is MapError,
      builder: (context, state) {
        if (state is! MapError) return const SizedBox.shrink();

        return Center(
          child: Container(
            padding: EdgeInsets.all(24.w),
            margin: EdgeInsets.symmetric(horizontal: 32.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.error_outline,
                  color: MyColors.states.error,
                  size: 48.w,
                ),
                SizedBox(height: 12.h),
                Text(
                  state.error.message ?? 'Failed to load tasks',
                  style: MyTextStyles.body.body2.copyWith(
                    color: MyColors.text.secondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                TextButton(
                  onPressed: () => context.read<MapCubit>().getMapTasks(),
                  child: Text(
                    'Retry',
                    style: MyTextStyles.button.secondaryButton2.copyWith(
                      color: MyColors.brand.purple,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
