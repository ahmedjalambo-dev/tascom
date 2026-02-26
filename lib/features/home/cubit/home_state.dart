import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_model.dart';
import '../../user/data/models/user_model.dart';
import '../data/models/all_tasks_response.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.initial() = HomeInitial;

  const factory HomeState.loading() = HomeLoading;

  const factory HomeState.success({
    required AllTasksResponse response,
    required Map<String, UserModel> creators,
    required Map<String, String> locationNames,
  }) = HomeSuccess;

  const factory HomeState.loadingMore({
    required AllTasksResponse currentData,
    required Map<String, UserModel> creators,
    required Map<String, String> locationNames,
  }) = HomeLoadingMore;

  const factory HomeState.error(ApiErrorModel error) = HomeError;

  const factory HomeState.claimLoading({
    required String taskId,
    required AllTasksResponse currentData,
    required Map<String, UserModel> creators,
    required Map<String, String> locationNames,
  }) = HomeClaimLoading;

  const factory HomeState.claimError({
    required ApiErrorModel error,
    required AllTasksResponse currentData,
    required Map<String, UserModel> creators,
    required Map<String, String> locationNames,
  }) = HomeClaimError;
}
