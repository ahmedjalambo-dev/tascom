import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/storage/session_manager.dart';
import '../../../login/data/models/login_response.dart';
import '../models/google_login_request.dart';
import '../services/google_login_service.dart';

class GoogleLoginRepo {
  final GoogleLoginService _googleLoginService;
  final SessionManager _sessionManager;

  GoogleLoginRepo(this._googleLoginService, this._sessionManager);

  Future<ApiResult<LoginResponse>> googleLogin(
    GoogleLoginRequest request,
  ) async {
    try {
      final response = await _googleLoginService.googleLogin(request);

      // Save session on successful Google login
      await _sessionManager.setSession(
        accessToken: response.data.token,
        refreshToken: response.data.token,
        userId: response.data.user.id,
        email: response.data.user.email,
        name: response.data.user.name,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
