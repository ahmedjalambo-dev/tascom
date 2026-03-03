import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tascom/core/services/location_service.dart';
import 'package:tascom/core/storage/shared_pref_helper.dart';
import '../data/models/login_request.dart';
import '../data/repos/login_repo.dart';
import '../../../../core/networking/api_result.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  Future<void> login({required String email, required String password}) async {
    emit(const LoginState.loading());

    // 1. Try to get location from preferences
    String? location = SharedPrefHelper.getUserLocation();

    // 2. If empty, attempt a fresh fetch
    if (location == null || location.isEmpty) {
      location = await LocationService.getCurrentLocation();

      if (location != null) {
        await SharedPrefHelper.setUserLocation(location);
      }
    }

    // 3. Fallback if still null
    location ??= '0.0,0.0';

    // Parse latitude and longitude from location string
    final parts = location.split(',');
    final latitude = double.tryParse(parts[0]) ?? 0.0;
    final longitude = double.tryParse(parts[1]) ?? 0.0;

    final result = await _loginRepo.login(
      LoginRequest(
        email: email,
        password: password,
        location: location,
        latitude: latitude,
        longitude: longitude,
      ),
    );

    result.when(
      success: (response) => emit(LoginState.success(response)),
      failure: (error) => emit(LoginState.error(error)),
    );
  }
}
