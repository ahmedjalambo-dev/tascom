import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/storage/session_manager.dart';
import '../services/logout_service.dart';

class LogoutRepo {
  final LogoutService _logoutService;
  final SessionManager _sessionManager;

  LogoutRepo(this._logoutService, this._sessionManager);

  Future<ApiResult<void>> logout() async {
    try {
      await _logoutService.logout();
      await _sessionManager.clearSession();
      return const ApiResult.success(null);
    } catch (error) {
      // Even if API call fails, clear local session
      await _sessionManager.clearSession();
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
