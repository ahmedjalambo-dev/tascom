import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tascom/core/services/location_service.dart';
import 'package:tascom/core/storage/shared_pref_helper.dart';
import '../data/models/register_request.dart';
import '../data/repos/register_repo.dart';
import '../../../../core/networking/api_result.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;

  RegisterCubit(this._registerRepo) : super(const RegisterState.initial());

  Future<void> register({
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    emit(const RegisterState.loading());

    // 1. Try to get location from preferences
    String? location = SharedPrefHelper.getUserLocation();

    // 2. If empty, attempt a fresh fetch
    if (location == null || location.isEmpty) {
      location = await LocationService.getCurrentLocation();

      // Save for future use if we got a valid location
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

    final result = await _registerRepo.register(
      RegisterRequest(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        location: location,
        latitude: latitude,
        longitude: longitude,
        password: password,
      ),
    );

    result.when(
      success: (response) => emit(RegisterState.success(response)),
      failure: (error) => emit(RegisterState.error(error)),
    );
  }
}
