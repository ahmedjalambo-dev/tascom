import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../models/reset_password_request.dart';
import '../services/reset_password_service.dart';

class ResetPasswordRepo {
  final ResetPasswordService _resetPasswordService;

  ResetPasswordRepo(this._resetPasswordService);

  Future<ApiResult<void>> resetPassword(ResetPasswordRequest request) async {
    try {
      await _resetPasswordService.resetPassword(request);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
