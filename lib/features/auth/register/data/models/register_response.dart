import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_response.freezed.dart';
part 'register_response.g.dart';

@freezed
abstract class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({
    String? message,
    @JsonKey(name: 'userId') String? userId,
    @JsonKey(name: 'user') RegisterUserData? user,
  }) = _RegisterResponse;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}

@freezed
abstract class RegisterUserData with _$RegisterUserData {
  const factory RegisterUserData({
    String? id,
    String? name,
    String? email,
  }) = _RegisterUserData;

  factory RegisterUserData.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserDataFromJson(json);
}
// Test123*