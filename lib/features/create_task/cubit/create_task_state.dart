import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_model.dart';

part 'create_task_state.freezed.dart';

@freezed
abstract class CreateTaskState with _$CreateTaskState {
  const factory CreateTaskState.initial() = _Initial;
  const factory CreateTaskState.loading() = _Loading;
  const factory CreateTaskState.success() = _Success;
  const factory CreateTaskState.error(ApiErrorModel error) = _Error;
}
