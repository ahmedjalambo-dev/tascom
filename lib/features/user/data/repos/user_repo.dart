import 'dart:convert';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../models/update_user_request.dart';
import '../models/user_model.dart';
import '../services/user_service.dart';

class UserRepo {
  final UserService _userService;

  UserRepo(this._userService);

  Future<ApiResult<UserModel>> getUser(String id) async {
    try {
      final response = await _userService.getUser(id);
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UserModel>> updateUser(
    String id,
    UpdateUserRequest request,
  ) async {
    try {
      final response = await _userService.updateUser(
        id,
        name: request.name,
        email: request.email,
        location: request.location,
        phoneNumber: request.phoneNumber,
        about: request.about,
        skills: request.skills != null ? jsonEncode(request.skills) : null,
        dateOfBirth: request.dateOfBirth?.toIso8601String(),
        gender: request.gender,
        file: request.avatarFile,
      );
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

}
