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

// Profile
import '../../features/profile/cubit/profile_cubit.dart';
import '../../features/profile/data/repos/profile_repo.dart';
import '../../features/profile/data/services/profile_service.dart';

// Edit Profile
import '../../features/settings/edit_profile/cubit/edit_profile_cubit.dart';
import '../../features/settings/edit_profile/data/repos/edit_profile_repo.dart';
import '../../features/settings/edit_profile/data/services/edit_profile_service.dart';

// Get Tasks
import '../../features/get_tasks/cubit/get_tasks_cubit.dart';
import '../../features/get_tasks/data/repos/get_tasks_repo.dart';
import '../../features/get_tasks/data/services/get_tasks_service.dart';

// Claim Task
import '../../features/claim_task/cubit/claim_task_cubit.dart';
import '../../features/claim_task/data/repos/claim_task_repo.dart';
import '../../features/claim_task/data/services/claim_task_service.dart';

// Create Task
import '../../features/create_task/cubit/create_task_cubit.dart';
import '../../features/create_task/data/repos/create_task_repo.dart';
import '../../features/create_task/data/services/create_task_service.dart';

// Delete Account
import '../../features/settings/delete_account/cubit/delete_account_cubit.dart';
import '../../features/settings/delete_account/data/repos/delete_account_repo.dart';
import '../../features/settings/delete_account/data/services/delete_account_service.dart';

// Search
import '../../features/search/cubit/search_cubit.dart';
import '../../features/search/data/repos/search_repo.dart';
import '../../features/search/data/services/search_service.dart';

// Get Comments
import '../../features/get_comments/cubit/get_comments_cubit.dart';
import '../../features/get_comments/data/repos/get_comments_repo.dart';
import '../../features/get_comments/data/services/get_comments_service.dart';

// Create Comment
import '../../features/create_comment/cubit/create_comment_cubit.dart';
import '../../features/create_comment/data/repos/create_comment_repo.dart';
import '../../features/create_comment/data/services/create_comment_service.dart';

// Delete Comment
import '../../features/delete_comment/cubit/delete_comment_cubit.dart';
import '../../features/delete_comment/data/repos/delete_comment_repo.dart';
import '../../features/delete_comment/data/services/delete_comment_service.dart';

// Edit Comment
import '../../features/edit_comment/cubit/edit_comment_cubit.dart';
import '../../features/edit_comment/data/repos/edit_comment_repo.dart';
import '../../features/edit_comment/data/services/edit_comment_service.dart';

// Save Task
import '../../features/save_task/cubit/save_task_cubit.dart';
import '../../features/save_task/data/repos/save_task_repo.dart';
import '../../features/save_task/data/services/save_task_service.dart';

// Like Task
import '../../features/like_task/cubit/like_task_cubit.dart';
import '../../features/like_task/data/repos/like_task_repo.dart';
import '../../features/like_task/data/services/like_task_service.dart';

// Saved Tasks
import '../../features/settings/save_tasks/cubit/saved_tasks_cubit.dart';
import '../../features/settings/save_tasks/data/repos/saved_tasks_repo.dart';
import '../../features/settings/save_tasks/data/services/saved_tasks_service.dart';

// Get Task
import '../../features/get_task/cubit/get_task_cubit.dart';
import '../../features/get_task/data/repos/get_task_repo.dart';
import '../../features/get_task/data/services/get_task_service.dart';

// Map
import '../../features/map/cubit/map_cubit.dart';
import '../../features/map/data/repos/map_repo.dart';
import '../../features/map/data/services/map_service.dart';

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

  // ============ Profile ============
  getIt.registerLazySingleton<ProfileService>(
    () => ProfileService(getIt<Dio>()),
  );
  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepo(getIt<ProfileService>()),
  );
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt<ProfileRepo>()));

  // ============ Edit Profile ============
  getIt.registerLazySingleton<EditProfileService>(
    () => EditProfileService(getIt<Dio>()),
  );
  getIt.registerLazySingleton<EditProfileRepo>(
    () => EditProfileRepo(getIt<EditProfileService>()),
  );
  getIt.registerFactory<EditProfileCubit>(
    () => EditProfileCubit(getIt<EditProfileRepo>()),
  );

  // ============ Get Tasks ============
  getIt.registerLazySingleton<GetTasksService>(
    () => GetTasksService(getIt<Dio>()),
  );
  getIt.registerLazySingleton<GetTasksRepo>(
    () => GetTasksRepo(getIt<GetTasksService>()),
  );
  getIt.registerFactory<GetTasksCubit>(
    () => GetTasksCubit(getIt<GetTasksRepo>(), getIt<ProfileService>()),
  );

  // ============ Claim Task ============
  getIt.registerLazySingleton<ClaimTaskService>(
    () => ClaimTaskService(getIt<Dio>()),
  );
  getIt.registerLazySingleton<ClaimTaskRepo>(
    () => ClaimTaskRepo(getIt<ClaimTaskService>()),
  );
  getIt.registerFactory<ClaimTaskCubit>(
    () => ClaimTaskCubit(getIt<ClaimTaskRepo>()),
  );

  // ============ Create Task ============
  getIt.registerLazySingleton<CreateTaskService>(
    () => CreateTaskService(getIt<Dio>()),
  );
  getIt.registerLazySingleton<CreateTaskRepo>(
    () => CreateTaskRepo(getIt<CreateTaskService>()),
  );
  getIt.registerFactory<CreateTaskCubit>(
    () => CreateTaskCubit(getIt<CreateTaskRepo>()),
  );

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

  // ============ Search ============
  getIt.registerLazySingleton<SearchService>(() => SearchService(getIt<Dio>()));
  getIt.registerLazySingleton<SearchRepo>(
    () => SearchRepo(getIt<SearchService>()),
  );
  getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt<SearchRepo>()));

  // ============ Get Comments ============
  getIt.registerLazySingleton<GetCommentsService>(
    () => GetCommentsService(getIt<Dio>()),
  );
  getIt.registerLazySingleton<GetCommentsRepo>(
    () => GetCommentsRepo(getIt<GetCommentsService>()),
  );
  getIt.registerFactory<GetCommentsCubit>(
    () => GetCommentsCubit(getIt<GetCommentsRepo>()),
  );

  // ============ Create Comment ============
  getIt.registerLazySingleton<CreateCommentService>(
    () => CreateCommentService(getIt<Dio>()),
  );
  getIt.registerLazySingleton<CreateCommentRepo>(
    () => CreateCommentRepo(getIt<CreateCommentService>()),
  );
  getIt.registerFactory<CreateCommentCubit>(
    () => CreateCommentCubit(getIt<CreateCommentRepo>()),
  );

  // ============ Delete Comment ============
  getIt.registerLazySingleton<DeleteCommentService>(
    () => DeleteCommentService(getIt<Dio>()),
  );
  getIt.registerLazySingleton<DeleteCommentRepo>(
    () => DeleteCommentRepo(getIt<DeleteCommentService>()),
  );
  getIt.registerFactory<DeleteCommentCubit>(
    () => DeleteCommentCubit(getIt<DeleteCommentRepo>()),
  );

  // ============ Edit Comment ============
  getIt.registerLazySingleton<EditCommentService>(
    () => EditCommentService(getIt<Dio>()),
  );
  getIt.registerLazySingleton<EditCommentRepo>(
    () => EditCommentRepo(getIt<EditCommentService>()),
  );
  getIt.registerFactory<EditCommentCubit>(
    () => EditCommentCubit(getIt<EditCommentRepo>()),
  );

  // ============ Save Task ============
  getIt.registerLazySingleton<SaveTaskService>(
    () => SaveTaskService(getIt<Dio>()),
  );
  getIt.registerLazySingleton<SaveTaskRepo>(
    () => SaveTaskRepo(getIt<SaveTaskService>()),
  );
  getIt.registerFactory<SaveTaskCubit>(
    () => SaveTaskCubit(getIt<SaveTaskRepo>()),
  );

  // ============ Like Task ============
  getIt.registerLazySingleton<LikeTaskService>(
    () => LikeTaskService(getIt<Dio>()),
  );
  getIt.registerLazySingleton<LikeTaskRepo>(
    () => LikeTaskRepo(getIt<LikeTaskService>()),
  );
  getIt.registerFactory<LikeTaskCubit>(
    () => LikeTaskCubit(getIt<LikeTaskRepo>()),
  );

  // ============ Saved Tasks ============
  getIt.registerLazySingleton<SavedTasksService>(
    () => SavedTasksService(getIt<Dio>()),
  );
  getIt.registerLazySingleton<SavedTasksRepo>(
    () => SavedTasksRepo(getIt<SavedTasksService>()),
  );
  getIt.registerFactory<SavedTasksCubit>(
    () => SavedTasksCubit(getIt<SavedTasksRepo>(), getIt<ProfileService>()),
  );

  // ============ Get Task ============
  getIt.registerLazySingleton<GetTaskService>(
    () => GetTaskService(getIt<Dio>()),
  );
  getIt.registerLazySingleton<GetTaskRepo>(
    () => GetTaskRepo(getIt<GetTaskService>()),
  );
  getIt.registerFactory<GetTaskCubit>(
    () => GetTaskCubit(getIt<GetTaskRepo>()),
  );

  // ============ Map ============
  getIt.registerLazySingleton<MapService>(() => MapService(getIt<Dio>()));
  getIt.registerLazySingleton<MapRepo>(() => MapRepo(getIt<MapService>()));
  getIt.registerFactory<MapCubit>(() => MapCubit(getIt<MapRepo>()));
}
