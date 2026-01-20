import 'package:flutter/material.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/features/add_post/ui/add_post_screen.dart';
import 'package:tascom/features/home/ui/home_screen.dart';
import 'package:tascom/features/navigation/ui/main_navigation_screen.dart';
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
      case MyRoutes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case MyRoutes.main:
        return MaterialPageRoute(
          builder: (context) => const MainNavigationScreen(),
        );
      case MyRoutes.addPost:
        return MaterialPageRoute(builder: (context) => const AddPostScreen());
        case MyRoutes.logIn:
        return MaterialPageRoute(builder: (context) => const LogIn());
        case MyRoutes.signUp:
        return MaterialPageRoute(builder: (context) => const SignUp());
      default:
        return null;
    }
  }
}
