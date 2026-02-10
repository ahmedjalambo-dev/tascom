import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required bool success,
    required LoginData data,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
abstract class LoginData with _$LoginData {
  const factory LoginData({
    required UserAuthData user,
    required String token,
  }) = _LoginData;

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
}

@freezed
abstract class UserAuthData with _$UserAuthData {
  const factory UserAuthData({
    required String id,
    required String name,
    required String email,
    String? role,
    String? phoneNumber,
    String? avatar,
    int? pointsBalance,
    double? ratingAvg,
    String? about,
    String? skills,
    String? location,
  }) = _UserAuthData;

  factory UserAuthData.fromJson(Map<String, dynamic> json) =>
      _$UserAuthDataFromJson(json);
}
