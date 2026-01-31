import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/reviews/ui/widgets/review_info.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Rate Your Experience",
              style: MyTextStyle.heading.h32.copyWith(fontSize: 18.sp),
            ),
            GestureDetector(
              onTap: () {
             
             Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ReviewInfoPage(),
      ),
    );
              
              },
              child: Icon(Icons.info_outline, color: MyColors.text.secondary, size: 20.sp),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Text(
          "Your feedback helps improve the community",
          style: MyTextStyle.body.body2.copyWith(color: MyColors.text.secondary),
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: List.generate(4, (index) => Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: Icon(Icons.star, color: MyColors.icons.star, size: 25.sp),
              ))..add(Icon(Icons.star, color: MyColors.border.border, size: 25.sp)),
            ),
            Text(
              "4/5 stars",
              style: MyTextStyle.label.label1.copyWith(color: MyColors.text.secondary),
            ),
          ],
        ),
      ],
    );
  }
}
