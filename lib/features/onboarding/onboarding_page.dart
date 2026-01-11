import 'package:flutter/material.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class OnBoardPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final BoxFit? imageFit;
  final bool halfScreenImage;
  final VoidCallback onSkipPressed;

  const OnBoardPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.onSkipPressed,
    this.imageFit,
    this.halfScreenImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.brand.purple,
      body: SafeArea(
        child: Stack(
          children: [
            halfScreenImage
                ? _buildHalfScreenLayout(context)
                : _buildDefaultLayout(context),
            //skip button
            Positioned(
              top: 16,
              right: 16,
              child: GestureDetector(
                onTap: onSkipPressed,
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: halfScreenImage 
                        ? MyColors.brand.purple  // for onboarding 2
                        : Colors.white,  // for onboarding 1 3
                   
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHalfScreenLayout(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        //onboarding 2 image
        Container(
          height: screenHeight / 2,
          width: double.infinity,
          child: Image.asset(imagePath, fit: BoxFit.cover), 
        ),
        Expanded(
          child: Container(
            color: MyColors.brand.purple,
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: MyTextStyle.heading.h1.copyWith(
                    color: MyColors.text.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
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
        ),
      ],
    );
  }

  Widget _buildDefaultLayout(BuildContext context) {
    //onboarding 1 3 image
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Image.asset(imagePath, fit: imageFit ?? BoxFit.contain),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: MyTextStyle.heading.h1.copyWith(
                    color: MyColors.text.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
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
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}