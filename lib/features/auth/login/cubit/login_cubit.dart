import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/login_request.dart';
import '../data/repos/login_repo.dart';
import '../../../../core/networking/api_result.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  Future<void> login({required String email, required String password}) async {
    emit(const LoginState.loading());

    final result = await _loginRepo.login(
      LoginRequest(email: email, password: password),
    );

    result.when(
      success: (response) => emit(LoginState.success(response)),
      failure: (error) => emit(LoginState.error(error)),
    );
  }
}
