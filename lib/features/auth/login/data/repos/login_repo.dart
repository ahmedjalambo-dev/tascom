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
        accessToken: response.data.token,
        refreshToken: response.data.token,
        userId: response.data.user.id,
        email: response.data.user.email,
        name: response.data.user.name,
        avatar: response.data.user.avatar,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
