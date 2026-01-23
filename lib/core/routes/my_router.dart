import 'package:flutter/material.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/features/add_post/ui/add_post_screen.dart';
import 'package:tascom/features/auth/create_new_password/ui/create_new_password_screen.dart';
import 'package:tascom/features/auth/forgot_password/ui/forgot_password_screen.dart';
import 'package:tascom/features/auth/login/ui/login_screen.dart';
import 'package:tascom/features/auth/sign_up/sign_up_screen.dart';
import 'package:tascom/features/home/ui/home_screen.dart';
import 'package:tascom/features/navigation/ui/main_navigation_screen.dart';
import 'package:tascom/features/onboarding/ui/onboarding_screen.dart';
import 'package:tascom/features/registration/login.dart';
import 'package:tascom/features/registration/password/new_password.dart';
import 'package:tascom/features/registration/password/password.dart';
import 'package:tascom/features/registration/sign_up.dart';

class MyRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MyRoutes.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );

      case MyRoutes.signUp:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case MyRoutes.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case MyRoutes.forgotPassword:
        return MaterialPageRoute(
            builder: (context) => const ForgotPasswordScreen());
      case MyRoutes.createNewPassword:
        return MaterialPageRoute(
            builder: (context) => const CreateNewPasswordScreen());

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
        case MyRoutes.forgetPassword:
        return MaterialPageRoute(builder: (context) => const ForgetPassword());
        case MyRoutes.newPassword:
        return MaterialPageRoute(builder: (context) => const NewPassword());
         
      default:
        return null;
    }
  }
}
