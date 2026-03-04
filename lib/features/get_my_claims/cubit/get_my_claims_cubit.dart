import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_result.dart';
import '../../../core/services/location_service.dart';
import '../../profile/data/services/profile_service.dart';
import '../../user/data/models/user_model.dart';
import '../data/models/my_claim_mapper.dart';
import '../data/models/my_claims_response.dart';
import '../data/repos/get_my_claims_repo.dart';
import 'get_my_claims_state.dart';

class GetMyClaimsCubit extends Cubit<GetMyClaimsState> {
  final GetMyClaimsRepo _repo;
  final ProfileService _userService;
  final Map<String, UserModel> _creatorsCache = {};
  final Map<String, String> _locationNamesCache = {};

  GetMyClaimsCubit(this._repo, this._userService)
      : super(const GetMyClaimsState.initial());

  Future<void> getMyClaims() async {
    emit(const GetMyClaimsState.loading());

    final result = await _repo.getMyClaims();

    switch (result) {
      case Success(data: final response):
        await _fetchCreatorsAndLocations(response.data);
        final tasks = response.data
            .map((c) => c.toTaskModel(
                  creators: _creatorsCache,
                  locationNames: _locationNamesCache,
                ))
            .toList();
        emit(GetMyClaimsState.success(tasks));
      case Failure(error: final error):
        emit(GetMyClaimsState.error(error));
    }
  }

  Future<void> _fetchCreatorsAndLocations(List<MyClaimData> claims) async {
    await Future.wait([_fetchCreators(claims), _resolveLocations(claims)]);
  }

  Future<void> _fetchCreators(List<MyClaimData> claims) async {
    final uniqueCreatorIds = claims
        .map((c) => c.task.creatorId)
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

  Future<void> _resolveLocations(List<MyClaimData> claims) async {
    final uniqueLocations = <String, (double, double)>{};
    for (final claim in claims) {
      final task = claim.task;
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
