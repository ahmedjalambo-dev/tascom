import 'package:flutter/material.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/features/home/ui/home_screen.dart';
import 'package:tascom/features/onboarding/ui/onboarding_screen.dart';

class MyRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MyRoutes.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case MyRoutes.home:
        // Placeholder for HomeScreen route
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      default:
        return null;
    }
  }
}
