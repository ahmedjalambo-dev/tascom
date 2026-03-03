import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../models/forgot_password_request.dart';
import '../services/forgot_password_service.dart';

class ForgotPasswordRepo {
  final ForgotPasswordService _forgotPasswordService;

  ForgotPasswordRepo(this._forgotPasswordService);

  Future<ApiResult<void>> forgotPassword(String email) async {
    try {
      await _forgotPasswordService.forgotPassword(
        ForgotPasswordRequest(email: email),
      );
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
