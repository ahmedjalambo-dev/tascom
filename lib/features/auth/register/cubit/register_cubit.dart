import 'package:flutter_bloc/flutter_bloc.dart';

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
    required String location,
    required String password,
  }) async {
    emit(const RegisterState.loading());

    final result = await _registerRepo.register(
      RegisterRequest(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        location: location,
        password: password,
      ),
    );

    result.when(
      success: (response) => emit(RegisterState.success(response)),
      failure: (error) => emit(RegisterState.error(error)),
    );
  }
}
