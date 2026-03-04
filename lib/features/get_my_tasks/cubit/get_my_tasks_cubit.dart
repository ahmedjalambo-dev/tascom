import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_result.dart';
import '../../../core/services/location_service.dart';
import '../../../core/storage/shared_pref_helper.dart';
import '../../home/data/models/user_model.dart';
import '../data/models/my_task_mapper.dart';
import '../data/models/my_tasks_response.dart';
import '../data/repos/get_my_tasks_repo.dart';
import 'get_my_tasks_state.dart';

class GetMyTasksCubit extends Cubit<GetMyTasksState> {
  final GetMyTasksRepo _repo;
  final Map<String, String> _locationNamesCache = {};

  GetMyTasksCubit(this._repo) : super(const GetMyTasksState.initial());

  Future<void> getMyTasks() async {
    emit(const GetMyTasksState.loading());

    final result = await _repo.getMyTasks();

    switch (result) {
      case Success(data: final response):
        await _resolveLocations(response.data);
        final currentUser = UserModel(
          id: SharedPrefHelper.getUserId() ?? '',
          name: SharedPrefHelper.getUserName() ?? 'Me',
          rating: 0,
        );
        final tasks = response.data
            .map((t) => t.toTaskModel(
                  currentUser: currentUser,
                  locationNames: _locationNamesCache,
                ))
            .toList();
        emit(GetMyTasksState.success(tasks));
      case Failure(error: final error):
        emit(GetMyTasksState.error(error));
    }
  }

  Future<void> _resolveLocations(List<MyTaskData> tasks) async {
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
                name.isNotEmpty ? name : 'Unknown';
          } else {
            _locationNamesCache[entry.key] = 'Unknown';
          }
        } catch (_) {
          _locationNamesCache[entry.key] = 'Unknown';
        }
      }),
    );
  }
}
