import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_result.dart';
import '../../../core/services/location_service.dart';
import '../../user/data/models/user_model.dart';
import '../../profile/data/services/profile_service.dart';
import '../data/models/all_tasks_response.dart';
import '../data/repos/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  final ProfileService _userService;

  int _currentPage = 1;
  static const int _limit = 10;
  List<TaskResponseData> _allTasks = [];
  final Map<String, UserModel> _creatorsCache = {};
  final Map<String, String> _locationNamesCache = {};

  HomeCubit(this._homeRepo, this._userService)
    : super(const HomeState.initial());

  Future<void> getAllTasks() async {
    _currentPage = 1;
    _allTasks = [];
    emit(const HomeState.loading());

    final result = await _homeRepo.getAllTasks(
      page: _currentPage,
      limit: _limit,
    );

    switch (result) {
      case Success(data: final response):
        _allTasks = List.from(response.data);
        await _fetchCreatorsAndLocations(response.data);
        emit(
          HomeState.success(
            response: response,
            creators: Map.from(_creatorsCache),
            locationNames: Map.from(_locationNamesCache),
          ),
        );
      case Failure(error: final error):
        emit(HomeState.error(error));
    }
  }

  Future<void> loadMore() async {
    final currentState = state;
    if (currentState is! HomeSuccess) return;

    final currentResponse = currentState.response;
    final currentCreators = currentState.creators;
    final currentLocationNames = currentState.locationNames;

    {
      if (_currentPage >= currentResponse.meta.totalPages) return;

      _currentPage++;

      emit(
        HomeState.loadingMore(
          currentData: currentResponse,
          creators: currentCreators,
          locationNames: currentLocationNames,
        ),
      );

      final result = await _homeRepo.getAllTasks(
        page: _currentPage,
        limit: _limit,
      );

      switch (result) {
        case Success(data: final response):
          _allTasks.addAll(response.data);
          await _fetchCreatorsAndLocations(response.data);

          final mergedResponse = AllTasksResponse(
            success: response.success,
            data: List.from(_allTasks),
            meta: response.meta,
          );

          emit(
            HomeState.success(
              response: mergedResponse,
              creators: Map.from(_creatorsCache),
              locationNames: Map.from(_locationNamesCache),
            ),
          );
        case Failure():
          _currentPage--;
          emit(
            HomeState.success(
              response: currentResponse,
              creators: currentCreators,
              locationNames: currentLocationNames,
            ),
          );
      }
    }
  }

  Future<void> _fetchCreatorsAndLocations(List<TaskResponseData> tasks) async {
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
        } catch (_) {
          // Silently skip if user fetch fails
        }
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
            final name = [country, city].where((s) => s.isNotEmpty).join(', ');
            _locationNamesCache[entry.key] = name.isNotEmpty ? name : 'Unknown';
          } else {
            _locationNamesCache[entry.key] = 'Unknown';
          }
        } catch (_) {
          _locationNamesCache[entry.key] = 'Unknown';
        }
      }),
    );
  }

  bool get hasMorePages {
    final currentState = state;
    if (currentState is HomeSuccess) {
      return _currentPage < currentState.response.meta.totalPages;
    }
    return false;
  }
}
