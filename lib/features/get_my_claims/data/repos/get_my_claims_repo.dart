import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../models/my_claims_response.dart';
import '../services/get_my_claims_service.dart';

class GetMyClaimsRepo {
  final GetMyClaimsService _service;

  GetMyClaimsRepo(this._service);

  Future<ApiResult<MyClaimsResponse>> getMyClaims() async {
    try {
      final response = await _service.getMyClaims();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
