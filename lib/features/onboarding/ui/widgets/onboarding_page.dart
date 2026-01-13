import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/core/widgets/spacing_widgets.dart';

class OnBoardingPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final bool isSecondPage;
  final bool isLastPage;
  final void Function()? onSkipTap;

  const OnBoardingPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.onSkipTap,
    this.isSecondPage = false,
    this.isLastPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.brand.purple,
      body: Stack(
        children: [
          Column(
            children: [
              // image on boarding
              Image.asset(imagePath, fit: BoxFit.fill),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: Column(
                  children: [
                    VerticalSpace(56.h),
                    // title
                    Text(
                      title,
                      style: MyTextStyle.heading.h1.copyWith(
                        color: MyColors.text.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    VerticalSpace(16.h),
                    // subtitle
                    Text(
                      subtitle,
                      style: MyTextStyle.body.body1.copyWith(
                        color: MyColors.text.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
          //skip button
          Visibility(
            // visible ture if not the last page
            visible: isLastPage ? false : true,
            child: Positioned(
              top: 72.h,
              right: 24.w,
              child: GestureDetector(
                onTap: onSkipTap,
                child: Text(
                  'Skip',
                  style: MyTextStyle.body.body1.copyWith(
                    color: isSecondPage
                        ? MyColors.brand.purple
                        : MyColors.text.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
