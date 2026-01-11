import 'package:flutter/material.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/features/onboarding/onboarding._screens.dart';

class MyRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MyRoutes.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );

      default:
        return null;
    }
  }
}
