import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/constants/my_images.dart';
import 'package:tascom/core/extentions/extentions.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/features/registration/onboarding/widgets/my_progress_indicator.dart';
import 'package:tascom/features/registration/onboarding/widgets/onboarding_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.brand.purple,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) => setState(() => currentPage = index),
            children: [
              OnBoardingPage(
                title: "Welcome to Tascom!",
                subtitle:
                    "Discover a community where tasks are shared, help is exchanged, and trust is built.",
                imagePath: MyImages.onboarding1,
                onSkipTap: () => context.pushReplacementNamed(MyRoutes.signUp),
              ),
              OnBoardingPage(
                title: " Connect Locally, Act Fast",
                subtitle:
                    "Find trusted helpers near you, available today or even right now.",
                imagePath: MyImages.onboarding2,
                isSecondPage: true,
                onSkipTap: () => context.pushReplacementNamed(MyRoutes.signUp),
              ),
              const OnBoardingPage(
                title: "Exchange Skills with Points",
                subtitle:
                    "Offer your skills, earn points, and use them to request help from others. No money involved.",
                imagePath: MyImages.onboarding3,
                isLastPage: true,
              ),
            ],
          ),
          // progress indicator with next button
          Positioned(
            bottom: 40.h,
            left: 0,
            right: 0,
            child: Center(
              child: MyProgressIndicator(
                currentPage: currentPage,
                totalPages: 3,
                onNextTap: () {
                  if (currentPage == 2) {
                    context.pushReplacementNamed(MyRoutes.signUp);
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
