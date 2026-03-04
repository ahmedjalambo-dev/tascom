import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_model.dart';
import '../../home/data/models/task_model.dart';

part 'get_my_claims_state.freezed.dart';

@freezed
abstract class GetMyClaimsState with _$GetMyClaimsState {
  const factory GetMyClaimsState.initial() = _Initial;
  const factory GetMyClaimsState.loading() = _Loading;
  const factory GetMyClaimsState.success(List<TaskModel> tasks) = _Success;
  const factory GetMyClaimsState.error(ApiErrorModel error) = _Error;
}
