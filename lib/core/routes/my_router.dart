import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tascom/core/di/injection.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/core/storage/session_manager.dart';
import 'package:tascom/features/map/ui/map_screen.dart';
import 'package:tascom/features/home/data/models/task_model.dart';
import 'package:tascom/features/create_task/cubit/create_task_cubit.dart';
import 'package:tascom/features/create_task/ui/create_task_screen.dart';
import 'package:tascom/features/home/ui/home_screen.dart';
import 'package:tascom/features/home/ui/task_details_screen.dart';
import 'package:tascom/features/auth/reset_password/create_new_password_screen.dart';
import 'package:tascom/features/auth/forgot_password/ui/forgot_password_screen.dart';
import 'package:tascom/features/auth/login/ui/login_screen.dart';
import 'package:tascom/features/onboarding/onboarding_screen.dart';
import 'package:tascom/features/auth/register/ui/register_screen.dart';
import 'package:tascom/features/search/ui/search_screen.dart';
import 'package:tascom/features/search/ui/helper_details_screen.dart';
import 'package:tascom/features/settings/settings_screen.dart';
import 'package:tascom/features/settings/points_history/points_history_screen.dart';
import 'package:tascom/features/settings/reports/reports_screen.dart';
import 'package:tascom/features/settings/requests/requests_screen.dart';
import 'package:tascom/features/settings/delete_account/ui/delete_account_screen.dart';
import 'package:tascom/features/settings/edit_profile/ui/edit_profile_screen.dart';
import 'package:tascom/features/settings/save_tasks/ui/saved_tasks_screen.dart';
import 'package:tascom/features/settings/save_tasks/cubit/saved_tasks_cubit.dart';
import 'package:tascom/features/save_task/cubit/save_task_cubit.dart';
import 'package:tascom/features/profile/profile_screen.dart';
import 'package:tascom/my_root_screen.dart';

// Auth Cubits
import 'package:tascom/features/auth/login/cubit/login_cubit.dart';
import 'package:tascom/features/auth/register/cubit/register_cubit.dart';
import 'package:tascom/features/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:tascom/features/auth/reset_password/cubit/reset_password_cubit.dart';
import 'package:tascom/features/auth/logout/cubit/logout_cubit.dart';

// Profile Cubit
import 'package:tascom/features/profile/cubit/profile_cubit.dart';

// Edit Profile Cubit
import 'package:tascom/features/settings/edit_profile/cubit/edit_profile_cubit.dart';

// Delete Account Cubit
import 'package:tascom/features/settings/delete_account/cubit/delete_account_cubit.dart';

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
        final userId = SessionManager.instance.currentUserId;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getIt<CreateTaskCubit>()),
              BlocProvider(
                create: (_) => getIt<ProfileCubit>()..getUser(userId ?? ''),
              ),
            ],
            child: const CreateTaskScreen(),
          ),
        );

      case MyRoutes.taskDetails:
        final taskModel = settings.arguments as TaskModel;
        return MaterialPageRoute(
          builder: (context) => TaskDetailsScreen(taskModel: taskModel),
        );

      case MyRoutes.search:
        return MaterialPageRoute(builder: (context) => const SearchScreen());

      case MyRoutes.ai:
        return MaterialPageRoute(builder: (context) => const MapScreen());

      case MyRoutes.profile:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) {
              final cubit = getIt<ProfileCubit>();
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

      case MyRoutes.requests:
        return MaterialPageRoute(builder: (context) => const RequestsScreen());

      case MyRoutes.deleteAccount:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => getIt<DeleteAccountCubit>(),
            child: const DeleteAccountScreen(),
          ),
        );

      case MyRoutes.helperDetails:
        final userId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => getIt<ProfileCubit>()..getUser(userId),
            child: HelperDetailsScreen(userId: userId),
          ),
        );

      case MyRoutes.savedTasks:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => getIt<SavedTasksCubit>()..getSavedTasks(),
              ),
              BlocProvider(create: (_) => getIt<SaveTaskCubit>()),
            ],
            child: const SavedTasksScreen(),
          ),
        );

      case MyRoutes.editProfile:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) {
              final cubit = getIt<EditProfileCubit>();
              final userId = SessionManager.instance.currentUserId;
              if (userId != null) {
                cubit.getUser(userId);
              }
              return cubit;
            },
            child: const EditProfileScreen(),
          ),
        );
    }
    return null;
  }
}
