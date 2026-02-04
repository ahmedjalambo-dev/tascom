import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/storage/session_manager.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';
import '../services/login_service.dart';

class LoginRepo {
  final LoginService _loginService;
  final SessionManager _sessionManager;

  LoginRepo(this._loginService, this._sessionManager);

  Future<ApiResult<LoginResponse>> login(LoginRequest request) async {
    try {
      final response = await _loginService.login(request);

      // Save session on successful login
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
