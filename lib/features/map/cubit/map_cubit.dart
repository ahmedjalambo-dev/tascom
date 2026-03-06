import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_result.dart';
import '../data/repos/map_repo.dart';
import 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  final MapRepo _repo;

  MapCubit(this._repo) : super(const MapState.initial());

  Future<void> getMapTasks() async {
    emit(const MapState.loading());

    final result = await _repo.getMapTasks();

    switch (result) {
      case Success(data: final response):
        emit(MapState.success(response));
      case Failure(error: final error):
        emit(MapState.error(error));
    }
  }
}
