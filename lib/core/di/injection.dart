import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../networking/dio_factory.dart';
import '../storage/session_manager.dart';

// Auth - Login
import '../../features/auth/login/cubit/login_cubit.dart';
import '../../features/auth/login/data/repos/login_repo.dart';
import '../../features/auth/login/data/services/login_service.dart';

// Auth - Register
import '../../features/auth/register/cubit/register_cubit.dart';
import '../../features/auth/register/data/repos/register_repo.dart';
import '../../features/auth/register/data/services/register_service.dart';

// Auth - Google Login
import '../../features/auth/google_login/cubit/google_login_cubit.dart';
import '../../features/auth/google_login/data/repos/google_login_repo.dart';
import '../../features/auth/google_login/data/services/google_login_service.dart';

// Auth - Logout
import '../../features/auth/logout/cubit/logout_cubit.dart';
import '../../features/auth/logout/data/repos/logout_repo.dart';
import '../../features/auth/logout/data/services/logout_service.dart';

// Auth - Forgot Password
import '../../features/auth/forgot_password/cubit/forgot_password_cubit.dart';
import '../../features/auth/forgot_password/data/repos/forgot_password_repo.dart';
import '../../features/auth/forgot_password/data/services/forgot_password_service.dart';

// Auth - Reset Password
import '../../features/auth/reset_password/cubit/reset_password_cubit.dart';
import '../../features/auth/reset_password/data/repos/reset_password_repo.dart';
import '../../features/auth/reset_password/data/services/reset_password_service.dart';

// User
import '../../features/user/cubit/user_cubit.dart';
import '../../features/user/data/repos/user_repo.dart';
import '../../features/user/data/services/user_service.dart';

// Delete Account
import '../../features/settings/delete_account/cubit/delete_account_cubit.dart';
import '../../features/settings/delete_account/data/repos/delete_account_repo.dart';
import '../../features/settings/delete_account/data/services/delete_account_service.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // ============ Core ============
  getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());
  getIt.registerLazySingleton<SessionManager>(() => SessionManager.instance);

  // ============ Auth - Login ============
  getIt.registerLazySingleton<LoginService>(() => LoginService(getIt<Dio>()));
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(getIt<LoginService>(), getIt<SessionManager>()),
  );
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  // ============ Auth - Register ============
  getIt.registerLazySingleton<RegisterService>(
    () => RegisterService(getIt<Dio>()),
  );
  getIt.registerLazySingleton<RegisterRepo>(
    () => RegisterRepo(getIt<RegisterService>()),
  );
  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(getIt<RegisterRepo>()),
  );

  // ============ Auth - Google Login ============
  getIt.registerLazySingleton<GoogleLoginService>(
    () => GoogleLoginService(getIt<Dio>()),
  );
  getIt.registerLazySingleton<GoogleLoginRepo>(
    () => GoogleLoginRepo(getIt<GoogleLoginService>(), getIt<SessionManager>()),
  );
  getIt.registerFactory<GoogleLoginCubit>(
    () => GoogleLoginCubit(getIt<GoogleLoginRepo>()),
  );

  // ============ Auth - Logout ============
  getIt.registerLazySingleton<LogoutService>(() => LogoutService(getIt<Dio>()));
  getIt.registerLazySingleton<LogoutRepo>(
    () => LogoutRepo(getIt<LogoutService>(), getIt<SessionManager>()),
  );
  getIt.registerFactory<LogoutCubit>(() => LogoutCubit(getIt<LogoutRepo>()));

  // ============ Auth - Forgot Password ============
  getIt.registerLazySingleton<ForgotPasswordService>(
    () => ForgotPasswordService(getIt<Dio>()),
  );
  getIt.registerLazySingleton<ForgotPasswordRepo>(
    () => ForgotPasswordRepo(getIt<ForgotPasswordService>()),
  );
  getIt.registerFactory<ForgotPasswordCubit>(
    () => ForgotPasswordCubit(getIt<ForgotPasswordRepo>()),
  );

  // ============ Auth - Reset Password ============
  getIt.registerLazySingleton<ResetPasswordService>(
    () => ResetPasswordService(getIt<Dio>()),
  );
  getIt.registerLazySingleton<ResetPasswordRepo>(
    () => ResetPasswordRepo(getIt<ResetPasswordService>()),
  );
  getIt.registerFactory<ResetPasswordCubit>(
    () => ResetPasswordCubit(getIt<ResetPasswordRepo>()),
  );

  // ============ User ============
  getIt.registerLazySingleton<UserService>(() => UserService(getIt<Dio>()));
  getIt.registerLazySingleton<UserRepo>(() => UserRepo(getIt<UserService>()));
  getIt.registerFactory<UserCubit>(() => UserCubit(getIt<UserRepo>()));

  // ============ Delete Account ============
  getIt.registerLazySingleton<DeleteAccountService>(
    () => DeleteAccountService(getIt<Dio>()),
  );
  getIt.registerLazySingleton<DeleteAccountRepo>(
    () => DeleteAccountRepo(getIt<DeleteAccountService>()),
  );
  getIt.registerFactory<DeleteAccountCubit>(
    () => DeleteAccountCubit(getIt<DeleteAccountRepo>()),
  );
}
