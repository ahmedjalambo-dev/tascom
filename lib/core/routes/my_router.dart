import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tascom/core/di/injection.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/core/storage/session_manager.dart';
import 'package:tascom/features/ai/ai_screen.dart';
import 'package:tascom/features/home/data/models/task_model.dart';
import 'package:tascom/features/home/ui/add_task_screen.dart';
import 'package:tascom/features/home/ui/home_screen.dart';
import 'package:tascom/features/home/ui/task_details_screen.dart';
import 'package:tascom/features/registration/create_new_password/create_new_password_screen.dart';
import 'package:tascom/features/registration/forgot_password/forgot_password_screen.dart';
import 'package:tascom/features/registration/lgoin/login_screen.dart';
import 'package:tascom/features/registration/onboarding/onboarding_screen.dart';
import 'package:tascom/features/auth/register/ui/register_screen.dart';
import 'package:tascom/features/search/search_screen.dart';
import 'package:tascom/features/settings/settings_screen.dart';
import 'package:tascom/features/settings/points_history/points_history_screen.dart';
import 'package:tascom/features/settings/reports/reports_screen.dart';
import 'package:tascom/features/settings/delete_account/delete_account_screen.dart';
import 'package:tascom/features/profile/profile_screen.dart';
import 'package:tascom/my_root_screen.dart';

// Auth Cubits
import 'package:tascom/features/auth/login/cubit/login_cubit.dart';
import 'package:tascom/features/auth/register/cubit/register_cubit.dart';
import 'package:tascom/features/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:tascom/features/auth/reset_password/cubit/reset_password_cubit.dart';
import 'package:tascom/features/auth/logout/cubit/logout_cubit.dart';

// User Cubit
import 'package:tascom/features/user/cubit/user_cubit.dart';

class MyRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MyRoutes.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );

      case MyRoutes.signUp:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => getIt<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
        );

      case MyRoutes.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case MyRoutes.forgotPassword:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => getIt<ForgotPasswordCubit>(),
            child: const ForgotPasswordScreen(),
          ),
        );

      case MyRoutes.createNewPassword:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => getIt<ResetPasswordCubit>(),
            child: const CreateNewPasswordScreen(),
          ),
        );

      case MyRoutes.root:
        return MaterialPageRoute(builder: (context) => const MyRootScreen());

      case MyRoutes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case MyRoutes.addTask:
        return MaterialPageRoute(builder: (context) => const AddTaskScreen());

      case MyRoutes.taskDetails:
        final taskModel = settings.arguments as TaskModel;
        return MaterialPageRoute(
          builder: (context) => TaskDetailsScreen(taskModel: taskModel),
        );

      case MyRoutes.search:
        return MaterialPageRoute(builder: (context) => const SearchScreen());

      case MyRoutes.ai:
        return MaterialPageRoute(builder: (context) => const AiScreen());

      case MyRoutes.profile:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) {
              final cubit = getIt<UserCubit>();
              final userId = SessionManager.instance.currentUserId;
              if (userId != null) {
                cubit.getUser(userId);
              }
              return cubit;
            },
            child: const ProfileScreen(),
          ),
        );

      case MyRoutes.settings:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => getIt<LogoutCubit>(),
            child: const SettingsScreen(),
          ),
        );

      case MyRoutes.pointsHistory:
        return MaterialPageRoute(
          builder: (context) => const PointsHistoryScreen(),
        );

      case MyRoutes.reports:
        return MaterialPageRoute(builder: (context) => const ReportsScreen());

      case MyRoutes.deleteAccount:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => getIt<UserCubit>(),
            child: const DeleteAccountScreen(),
          ),
        );
    }
    return null;
  }
}
