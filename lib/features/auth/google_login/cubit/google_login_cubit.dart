import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/google_login_request.dart';
import '../data/repos/google_login_repo.dart';
import '../../../../core/networking/api_result.dart';
import 'google_login_state.dart';

class GoogleLoginCubit extends Cubit<GoogleLoginState> {
  final GoogleLoginRepo _googleLoginRepo;

  GoogleLoginCubit(this._googleLoginRepo)
    : super(const GoogleLoginState.initial());

  Future<void> googleLogin({required String idToken, String? location}) async {
    emit(const GoogleLoginState.loading());

    // Parse latitude and longitude from location string
    double? latitude;
    double? longitude;
    if (location != null && location.contains(',')) {
      final parts = location.split(',');
      latitude = double.tryParse(parts[0]);
      longitude = double.tryParse(parts[1]);
    }

    final result = await _googleLoginRepo.googleLogin(
      GoogleLoginRequest(
        idToken: idToken,
        location: location,
        latitude: latitude,
        longitude: longitude,
      ),
    );

    result.when(
      success: (response) => emit(GoogleLoginState.success(response)),
      failure: (error) => emit(GoogleLoginState.error(error)),
    );
  }
}
