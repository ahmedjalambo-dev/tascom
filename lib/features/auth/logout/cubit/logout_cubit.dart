import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repos/logout_repo.dart';
import '../../../../core/networking/api_result.dart';
import 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final LogoutRepo _logoutRepo;

  LogoutCubit(this._logoutRepo) : super(const LogoutState.initial());

  Future<void> logout() async {
    emit(const LogoutState.loading());

    final result = await _logoutRepo.logout();

    result.when(
      success: (_) => emit(const LogoutState.success()),
      failure: (error) => emit(LogoutState.error(error)),
    );
  }
}
