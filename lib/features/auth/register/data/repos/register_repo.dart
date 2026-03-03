import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../models/register_request.dart';
import '../models/register_response.dart';
import '../services/register_service.dart';

class RegisterRepo {
  final RegisterService _registerService;

  RegisterRepo(this._registerService);

  Future<ApiResult<RegisterResponse>> register(RegisterRequest request) async {
    try {
      final response = await _registerService.register(request);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
