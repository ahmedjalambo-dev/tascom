import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/storage/session_manager.dart';
import '../../../login/data/models/login_response.dart';
import '../models/register_request.dart';
import '../services/register_service.dart';

class RegisterRepo {
  final RegisterService _registerService;
  final SessionManager _sessionManager;

  RegisterRepo(this._registerService, this._sessionManager);

  Future<ApiResult<LoginResponse>> register(RegisterRequest request) async {
    try {
      final response = await _registerService.register(request);

      // Save session on successful registration
      await _sessionManager.setSession(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
        userId: response.userId,
        email: response.user?.email,
        name: response.user?.name,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
