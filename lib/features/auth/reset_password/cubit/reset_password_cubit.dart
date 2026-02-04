import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/reset_password_request.dart';
import '../data/repos/reset_password_repo.dart';
import '../../../../core/networking/api_result.dart';
import 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordRepo _resetPasswordRepo;

  ResetPasswordCubit(this._resetPasswordRepo)
    : super(const ResetPasswordState.initial());

  Future<void> resetPassword({
    required String token,
    required String password,
    required String confirmPassword,
  }) async {
    emit(const ResetPasswordState.loading());

    final result = await _resetPasswordRepo.resetPassword(
      ResetPasswordRequest(
        token: token,
        password: password,
        confirmPassword: confirmPassword,
      ),
    );

    result.when(
      success: (_) => emit(const ResetPasswordState.success()),
      failure: (error) => emit(ResetPasswordState.error(error)),
    );
  }
}
