import 'package:flutter/material.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/features/onboarding/ui/onboarding_screen.dart';
import 'package:tascom/features/registration/login.dart';
import 'package:tascom/features/registration/sign_up.dart';

class MyRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MyRoutes.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );

      case MyRoutes.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUp(),
        );
        case MyRoutes.logIn:
        return MaterialPageRoute(
          builder: (context) => const LogIn(),
        );

      default:
        return null;
    }

  }

}



