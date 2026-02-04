import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repos/forgot_password_repo.dart';
import '../../../../core/networking/api_result.dart';
import 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordRepo _forgotPasswordRepo;

  ForgotPasswordCubit(this._forgotPasswordRepo)
    : super(const ForgotPasswordState.initial());

  Future<void> forgotPassword({required String email}) async {
    emit(const ForgotPasswordState.loading());

    final result = await _forgotPasswordRepo.forgotPassword(email);

    result.when(
      success: (_) => emit(const ForgotPasswordState.success()),
      failure: (error) => emit(ForgotPasswordState.error(error)),
    );
  }
}
