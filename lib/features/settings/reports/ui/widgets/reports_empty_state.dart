import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/core/widgets/spacing_widgets.dart';

class ReportsEmptyState extends StatelessWidget {
  const ReportsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              SvgPicture.asset('assets/svg/Objects.svg'),
        
           const VerticalSpace(16),

            Text(
              "No reported tasks yet",
              style: MyTextStyle.heading.h22.copyWith(
                fontWeight: FontWeight.w600,
                color: MyColors.text.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "There are no tasks reported at the moment.\nIf an issue arises, reported tasks\nwill appear here for review.",
              textAlign: TextAlign.center,
              style: MyTextStyle.body.body2.copyWith(
                color: MyColors.text.secondary,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
