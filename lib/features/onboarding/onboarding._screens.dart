import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/features/onboarding/onboarding_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.brand.purple,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: [
                OnBoardPage(
                  title: "Welcome to Tascom!",
                  subtitle:
                      "Discover a community where tasks are shared, help is exchanged, and trust is built.",
                  imagePath: 'assets/images/onbord1.png',
                  imageFit: BoxFit.fill, onSkipPressed: () {  },

                  
                ),
                OnBoardPage(
                  title: " Connect Locally, Act Fast",
                  subtitle:
                      "Find trusted helpers near you, available today or even right now.",
                  imagePath: 'assets/images/onbord2.png',
                  imageFit: BoxFit.fill,
                  halfScreenImage: true,
                  onSkipPressed: () {  },
                ),
                OnBoardPage(
                  title: "Exchange Skills with Points",
                  subtitle:
                      "Offer your skills, earn points, and use them to request help from others.  No money involved.",
                  imagePath: 'assets/images/onbord3.png',
                  imageFit: BoxFit.fill,
                    
                    onSkipPressed: () {  },
                ),
              ],
            ),
            SizedBox(height: 50),
            //nav button with cirle indicator
                 if (currentPage == 0 || currentPage == 1) // show only on pages 1 and 2
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: Center(
                  child: CircularPercentIndicator(
                    radius: 36,
                    lineWidth: 4,
                    percent: (currentPage + 1) / 3,
                    progressColor: Colors.white,
                    backgroundColor:  Colors.white,
                    animation: true,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: MyColors.brand.purple,
                        ),
                      ),
                    ),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}