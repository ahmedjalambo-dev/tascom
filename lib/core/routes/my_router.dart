import 'package:flutter/material.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/features/ai/ai_screen.dart';
import 'package:tascom/features/home/data/models/task_post.dart';
import 'package:tascom/features/home/ui/add_task_screen.dart';
import 'package:tascom/features/home/ui/home_screen.dart';
import 'package:tascom/features/home/ui/task_details_screen.dart';
import 'package:tascom/features/registration/create_new_password/create_new_password_screen.dart';
import 'package:tascom/features/registration/forgot_password/forgot_password_screen.dart';
import 'package:tascom/features/registration/lgoin/login_screen.dart';
import 'package:tascom/features/registration/onboarding/onboarding_screen.dart';
import 'package:tascom/features/registration/sign_up/sign_up_screen.dart';
import 'package:tascom/features/search/search_screen.dart';
import 'package:tascom/features/user/profile_screen.dart';
import 'package:tascom/my_root_screen.dart';

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
          builder: (context) => const ForgotPasswordScreen(),
        );
      case MyRoutes.createNewPassword:
        return MaterialPageRoute(
          builder: (context) => const CreateNewPasswordScreen(),
        );
      case MyRoutes.root:
        return MaterialPageRoute(builder: (context) => const MyRootScreen());
      case MyRoutes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case MyRoutes.addTask:
        return MaterialPageRoute(builder: (context) => const AddTaskScreen());
      case MyRoutes.taskDetails:
        final taskPost = settings.arguments as TaskPost;
        return MaterialPageRoute(
          builder: (context) => TaskDetailsScreen(taskPost: taskPost),
        );
      case MyRoutes.search:
        return MaterialPageRoute(builder: (context) => const SearchScreen());
      case MyRoutes.ai:
        return MaterialPageRoute(builder: (context) => const AiScreen());
      case MyRoutes.profile:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
    }
    return null;
  }
}
