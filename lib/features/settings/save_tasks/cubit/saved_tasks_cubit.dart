import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/services/location_service.dart';
import '../../../get_tasks/data/models/all_tasks_response.dart';
import '../../../profile/data/services/profile_service.dart';
import '../../../user/data/models/user_model.dart';
import '../data/repos/saved_tasks_repo.dart';
import 'saved_tasks_state.dart';

class SavedTasksCubit extends Cubit<SavedTasksState> {
  final SavedTasksRepo _repo;
  final ProfileService _userService;

  final Map<String, UserModel> _creatorsCache = {};
  final Map<String, String> _locationNamesCache = {};

  SavedTasksCubit(this._repo, this._userService)
      : super(const SavedTasksState.initial());

  Future<void> getSavedTasks() async {
    emit(const SavedTasksState.loading());

    final result = await _repo.getSavedTasks();

    switch (result) {
      case Success(data: final response):
        await _fetchCreatorsAndLocations(response.data);
        emit(SavedTasksState.success(
          tasks: response.data,
          creators: Map.from(_creatorsCache),
          locationNames: Map.from(_locationNamesCache),
        ));
      case Failure(error: final error):
        emit(SavedTasksState.error(error));
    }
  }

  void removeTask(String taskId) {
    state.maybeWhen(
      success: (tasks, creators, locationNames) {
        final updated = tasks.where((t) => t.id != taskId).toList();
        emit(SavedTasksState.success(
          tasks: updated,
          creators: creators,
          locationNames: locationNames,
        ));
      },
      orElse: () {},
    );
  }

  Future<void> _fetchCreatorsAndLocations(
      List<TaskResponseData> tasks) async {
    await Future.wait([_fetchCreators(tasks), _resolveLocations(tasks)]);
  }

  Future<void> _fetchCreators(List<TaskResponseData> tasks) async {
    final uniqueCreatorIds = tasks
        .map((t) => t.creatorId)
        .where((id) => !_creatorsCache.containsKey(id))
        .toSet();

    await Future.wait(
      uniqueCreatorIds.map((creatorId) async {
        try {
          final response = await _userService.getUser(creatorId);
          _creatorsCache[creatorId] = response.data;
        } catch (_) {}
      }),
    );
  }

  Future<void> _resolveLocations(List<TaskResponseData> tasks) async {
    final uniqueLocations = <String, (double, double)>{};

    for (final task in tasks) {
      if (task.latitude != null && task.longitude != null) {
        final key = '${task.latitude},${task.longitude}';
        if (!_locationNamesCache.containsKey(key)) {
          uniqueLocations[key] = (task.latitude!, task.longitude!);
        }
      }
    }

    await Future.wait(
      uniqueLocations.entries.map((entry) async {
        try {
          final (lat, lng) = entry.value;
          final placemark = await LocationService.getPlacemark(lat, lng);
          if (placemark != null) {
            final country = placemark.country ?? '';
            final city = placemark.locality ?? '';
            final name =
                [country, city].where((s) => s.isNotEmpty).join(', ');
            _locationNamesCache[entry.key] =
                name.isNotEmpty ? name : entry.key;
          } else {
            _locationNamesCache[entry.key] = entry.key;
          }
        } catch (_) {
          _locationNamesCache[entry.key] = entry.key;
        }
      }),
    );
  }
}
