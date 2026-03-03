import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_result.dart';
import '../../../core/services/location_service.dart';
import '../../../core/storage/shared_pref_helper.dart';
import '../../home/data/models/task_category.dart';
import '../../home/data/models/task_priority.dart';
import '../data/models/search_meta.dart';
import '../data/models/search_person_data.dart';
import '../data/models/search_response.dart';
import '../data/models/search_task_data.dart';
import '../data/repos/search_repo.dart';
import '../data/search_filter_result.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _repo;

  int _currentPage = 1;
  static const int _limit = 10;

  List<SearchTaskData> _allTasks = [];
  List<SearchPersonData> _allPeople = [];
  Map<String, String> _resolvedLocations = {};

  String _searchType = 'tasks';
  String? _query;
  String? _mode;
  SearchFilterResult? _filter;

  List<String> _recentSearches = [];

  String get searchType => _searchType;
  String? get activeMode => _mode;
  List<String> get recentSearches => _recentSearches;
  SearchFilterResult? get currentFilter => _filter;
  Map<String, String> get resolvedLocations => _resolvedLocations;

  SearchCubit(this._repo) : super(const SearchState.initial()) {
    _loadRecentSearches();
  }

  void _loadRecentSearches() {
    _recentSearches = SharedPrefHelper.getRecentSearches();
  }

  void setSearchType(String type) {
    final apiType = type.toLowerCase();
    if (_searchType == apiType) return;
    _searchType = apiType;
    if (_query != null && _query!.isNotEmpty) {
      _resetAndSearch();
    }
  }

  void setQuickFilter(String filter) {
    final apiMode = _modeToApiValue(filter);
    _mode = (_mode == apiMode) ? null : apiMode;
    _resetAndSearch();
  }

  void applyFilter(SearchFilterResult filter) {
    _filter = filter;
    _resetAndSearch();
  }

  void clearFilter() {
    _filter = null;
    if (_query != null && _query!.isNotEmpty || _mode != null) {
      _resetAndSearch();
    }
  }

  Future<void> search(String query) async {
    _query = query.isEmpty ? null : query;
    if (query.isNotEmpty) {
      _addRecentSearch(query);
    }
    await _resetAndSearch();
  }

  Future<void> _resetAndSearch() async {
    _currentPage = 1;
    _allTasks = [];
    _allPeople = [];
    _resolvedLocations = {};
    emit(const SearchState.loading());
    await _executeSearch();
  }

  Future<void> loadMore() async {
    SearchMeta? meta;
    List<dynamic> currentItems;

    final currentState = state;
    if (currentState is SearchTasksSuccess) {
      meta = currentState.meta;
      currentItems = _allTasks;
    } else if (currentState is SearchPeopleSuccess) {
      meta = currentState.meta;
      currentItems = _allPeople;
    } else {
      return;
    }

    final totalPages = (meta.total / meta.limit).ceil();
    if (_currentPage >= totalPages) return;

    _currentPage++;
    emit(SearchState.loadingMore(currentItems: currentItems, meta: meta));
    await _executeSearch(isLoadMore: true);
  }

  Future<void> _executeSearch({bool isLoadMore = false}) async {
    double? userLat;
    double? userLng;
    final locationStr = SharedPrefHelper.getUserLocation();
    if (locationStr != null && locationStr.contains(',')) {
      final parts = locationStr.split(',');
      userLat = double.tryParse(parts[0].trim());
      userLng = double.tryParse(parts[1].trim());
    }

    final result = await _repo.search(
      type: _searchType,
      query: _query,
      mode: _mode,
      categories: _filter?.categories.isNotEmpty == true
          ? _filter!.categories.map((c) => c.toApiValue).join(',')
          : null,
      priorities: _filter?.priority != null
          ? _filter!.priority!.toApiValue
          : null,
      minPoints: _filter?.pointsRange.start.toInt(),
      maxPoints: _filter?.pointsRange.end.toInt(),
      minRating: _filter?.ratingRange?.start,
      maxRating: _filter?.ratingRange?.end,
      minDistance: _filter?.locationRange.start.toInt(),
      maxDistance: _filter?.locationRange.end.toInt(),
      userLat: userLat,
      userLng: userLng,
      page: _currentPage,
      limit: _limit,
    );

    switch (result) {
      case Success(data: final response):
        if (response is SearchTasksResponse) {
          if (isLoadMore) {
            _allTasks.addAll(response.tasks);
          } else {
            _allTasks = List.from(response.tasks);
          }

          if (_allTasks.isEmpty) {
            emit(const SearchState.empty());
          } else {
            emit(
              SearchState.tasksSuccess(
                tasks: List.from(_allTasks),
                meta: response.meta,
              ),
            );
          }
        } else if (response is SearchPeopleResponse) {
          if (isLoadMore) {
            _allPeople.addAll(response.people);
          } else {
            _allPeople = List.from(response.people);
          }

          if (_allPeople.isEmpty) {
            emit(const SearchState.empty());
          } else {
            emit(
              SearchState.peopleSuccess(
                people: List.from(_allPeople),
                meta: response.meta,
              ),
            );
            _resolveLocations(_allPeople);
          }
        }
      case Failure(error: final error):
        if (isLoadMore) {
          _currentPage--;
          if (_searchType == 'tasks' && _allTasks.isNotEmpty) {
            emit(
              SearchState.tasksSuccess(
                tasks: List.from(_allTasks),
                meta: SearchMeta(
                  total: _allTasks.length,
                  page: _currentPage,
                  limit: _limit,
                ),
              ),
            );
            return;
          } else if (_searchType == 'people' && _allPeople.isNotEmpty) {
            emit(
              SearchState.peopleSuccess(
                people: List.from(_allPeople),
                meta: SearchMeta(
                  total: _allPeople.length,
                  page: _currentPage,
                  limit: _limit,
                ),
              ),
            );
            return;
          }
        }
        emit(SearchState.error(error));
    }
  }

  Future<void> _resolveLocations(List<SearchPersonData> people) async {
    for (final person in people) {
      if (person.location != null &&
          !_resolvedLocations.containsKey(person.id)) {
        final parts = person.location!.split(',');
        if (parts.length == 2) {
          final lat = double.tryParse(parts[0].trim());
          final lng = double.tryParse(parts[1].trim());
          if (lat != null && lng != null) {
            final placemark = await LocationService.getPlacemark(lat, lng);
            if (placemark != null) {
              final locationParts = <String>[];
              if (placemark.country != null && placemark.country!.isNotEmpty) {
                locationParts.add(placemark.country!);
              }
              if (placemark.locality != null &&
                  placemark.locality!.isNotEmpty) {
                locationParts.add(placemark.locality!);
              }
              if (locationParts.isNotEmpty) {
                _resolvedLocations[person.id] = locationParts.join(', ');
              }
            }
          }
        }
      }
    }
    if (state is SearchPeopleSuccess) {
      final s = state as SearchPeopleSuccess;
      emit(SearchState.peopleSuccess(people: s.people, meta: s.meta));
    }
  }

  String _modeToApiValue(String label) {
    switch (label) {
      case 'Near me':
        return 'near_me';
      case 'Available today':
        return 'available_today';
      case 'Top rated':
        return 'top_rated';
      case 'Quick tasks':
        return 'quick';
      default:
        return label;
    }
  }

  String? modeToLabel(String? apiValue) {
    switch (apiValue) {
      case 'near_me':
        return 'Near me';
      case 'available_today':
        return 'Available today';
      case 'top_rated':
        return 'Top rated';
      case 'quick':
        return 'Quick tasks';
      default:
        return null;
    }
  }

  void _addRecentSearch(String query) {
    _recentSearches.remove(query);
    _recentSearches.insert(0, query);
    if (_recentSearches.length > 10) {
      _recentSearches = _recentSearches.sublist(0, 10);
    }
    SharedPrefHelper.setRecentSearches(_recentSearches);
  }

  void clearRecentSearches() {
    _recentSearches = [];
    SharedPrefHelper.setRecentSearches(_recentSearches);
    emit(state);
  }

  void resetToInitial() {
    _currentPage = 1;
    _allTasks = [];
    _allPeople = [];
    _resolvedLocations = {};
    _query = null;
    _mode = null;
    _filter = null;
    _searchType = 'tasks';
    emit(const SearchState.initial());
  }

  bool get hasMorePages {
    final currentState = state;
    if (currentState is SearchTasksSuccess) {
      return _currentPage <
          (currentState.meta.total / currentState.meta.limit).ceil();
    }
    if (currentState is SearchPeopleSuccess) {
      return _currentPage <
          (currentState.meta.total / currentState.meta.limit).ceil();
    }
    return false;
  }
}
