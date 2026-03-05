import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_model.dart';
import '../data/models/map_tasks_response.dart';

part 'map_state.freezed.dart';

@freezed
abstract class MapState with _$MapState {
  const factory MapState.initial() = MapInitial;
  const factory MapState.loading() = MapLoading;
  const factory MapState.success(MapTasksResponse response) = MapSuccess;
  const factory MapState.error(ApiErrorModel error) = MapError;
}
