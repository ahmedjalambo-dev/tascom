import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_result.dart';
import '../../../core/services/location_service.dart';
import '../../user/data/models/user_model.dart';
import '../../profile/data/services/profile_service.dart';
import '../data/models/all_tasks_response.dart';
import '../data/repos/get_tasks_repo.dart';
import 'get_tasks_state.dart';

class GetTasksCubit extends Cubit<GetTasksState> {
  final GetTasksRepo _repo;
  final ProfileService _userService;

  int _currentPage = 1;
  static const int _limit = 10;
  String? _currentCategory;
  String? _currentSortBy;
  final List<String> _selectedPriorities = [];
  List<TaskResponseData> _allTasks = [];
  final Map<String, UserModel> _creatorsCache = {};
  final Map<String, String> _locationNamesCache = {};

  String? get currentCategory => _currentCategory;
  String? get currentSortBy => _currentSortBy;
  List<String> get selectedPriorities => _selectedPriorities;

  GetTasksCubit(this._repo, this._userService)
    : super(const GetTasksState.initial());

  Future<void> getAllTasks({String? category}) async {
    _currentPage = 1;
    _allTasks = [];
    if (category != null) _currentCategory = category;
    emit(const GetTasksState.loading());

    final prioritiesParam = _selectedPriorities.isNotEmpty
        ? _selectedPriorities.join(',')
        : null;

    final result = await _repo.getAllTasks(
      page: _currentPage,
      limit: _limit,
      category: _currentCategory,
      sortBy: _currentSortBy,
      priorities: prioritiesParam,
    );

    switch (result) {
      case Success(data: final response):
        _allTasks = List.from(response.data);
        await _fetchCreatorsAndLocations(response.data);
        emit(
          GetTasksState.success(
            response: response,
            creators: Map.from(_creatorsCache),
            locationNames: Map.from(_locationNamesCache),
          ),
        );
      case Failure(error: final error):
        emit(GetTasksState.error(error));
    }
  }

  Future<void> loadMore() async {
    final currentState = state;
    if (currentState is! GetTasksSuccess) return;

    final currentResponse = currentState.response;
    final currentCreators = currentState.creators;
    final currentLocationNames = currentState.locationNames;

    {
      if (_currentPage >= currentResponse.meta.totalPages) return;

      _currentPage++;

      emit(
        GetTasksState.loadingMore(
          currentData: currentResponse,
          creators: currentCreators,
          locationNames: currentLocationNames,
        ),
      );

      final prioritiesParam = _selectedPriorities.isNotEmpty
          ? _selectedPriorities.join(',')
          : null;

      final result = await _repo.getAllTasks(
        page: _currentPage,
        limit: _limit,
        category: _currentCategory,
        sortBy: _currentSortBy,
        priorities: prioritiesParam,
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
            GetTasksState.success(
              response: mergedResponse,
              creators: Map.from(_creatorsCache),
              locationNames: Map.from(_locationNamesCache),
            ),
          );
        case Failure():
          _currentPage--;
          emit(
            GetTasksState.success(
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
            _locationNamesCache[entry.key] = name.isNotEmpty ? name : entry.key;
          } else {
            _locationNamesCache[entry.key] = entry.key;
          }
        } catch (_) {
          _locationNamesCache[entry.key] = entry.key;
        }
      }),
    );
  }

  Future<void> filterByCategory(String? category) async {
    _currentCategory = category;
    await getAllTasks();
  }

  Future<void> setSortBy(String? sortBy) async {
    _currentSortBy = sortBy;
    await getAllTasks();
  }

  Future<void> setPriorities(List<String> priorities) async {
    _selectedPriorities
      ..clear()
      ..addAll(priorities);
    await getAllTasks();
  }

  void toggleSaved(String taskId, bool isSaved) {
    final currentState = state;
    AllTasksResponse? currentResponse;
    Map<String, UserModel>? creators;
    Map<String, String>? locationNames;

    if (currentState is GetTasksSuccess) {
      currentResponse = currentState.response;
      creators = currentState.creators;
      locationNames = currentState.locationNames;
    } else if (currentState is GetTasksLoadingMore) {
      currentResponse = currentState.currentData;
      creators = currentState.creators;
      locationNames = currentState.locationNames;
    }

    if (currentResponse == null) return;

    final updatedTasks = currentResponse.data
        .map((t) => t.id == taskId ? t.copyWith(saved: isSaved) : t)
        .toList();
    _allTasks = updatedTasks;

    emit(
      GetTasksState.success(
        response: currentResponse.copyWith(data: updatedTasks),
        creators: creators!,
        locationNames: locationNames!,
      ),
    );
  }

  void toggleLiked(String taskId, bool isLiked, int numOfLikes) {
    final currentState = state;
    AllTasksResponse? currentResponse;
    Map<String, UserModel>? creators;
    Map<String, String>? locationNames;

    if (currentState is GetTasksSuccess) {
      currentResponse = currentState.response;
      creators = currentState.creators;
      locationNames = currentState.locationNames;
    } else if (currentState is GetTasksLoadingMore) {
      currentResponse = currentState.currentData;
      creators = currentState.creators;
      locationNames = currentState.locationNames;
    }

    if (currentResponse == null) return;

    final updatedTasks = currentResponse.data
        .map(
          (t) => t.id == taskId
              ? t.copyWith(liked: isLiked, numOfLikes: numOfLikes)
              : t,
        )
        .toList();
    _allTasks = updatedTasks;

    emit(
      GetTasksState.success(
        response: currentResponse.copyWith(data: updatedTasks),
        creators: creators!,
        locationNames: locationNames!,
      ),
    );
  }

  bool get hasMorePages {
    final currentState = state;
    if (currentState is GetTasksSuccess) {
      return _currentPage < currentState.response.meta.totalPages;
    }
    return false;
  }
}
