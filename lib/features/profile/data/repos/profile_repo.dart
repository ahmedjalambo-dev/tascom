import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../user/data/models/user_model.dart';
import '../services/profile_service.dart';

class ProfileRepo {
  final ProfileService _profileService;

  ProfileRepo(this._profileService);

  Future<ApiResult<UserModel>> getUser(String id) async {
    try {
      final response = await _profileService.getUser(id);
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
