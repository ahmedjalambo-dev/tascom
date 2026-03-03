import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

Object? _readAvatar(Map<dynamic, dynamic> json, String key) {
  if (json['avatar'] != null) return json['avatar'];
  final assets = json['assets'];
  if (assets is List && assets.isNotEmpty) {
    return assets[0]['url'];
  }
  return null;
}

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String name,
    required String email,
    String? phoneNumber,
    String? location,
    String? about,
    String? skills,
    @JsonKey(name: 'DOB') DateTime? dateOfBirth,
    String? gender,
    @JsonKey(readValue: _readAvatar) String? avatar,
    @JsonKey(name: 'ratingAvg') double? rating,
    int? reviewCount,
    @JsonKey(name: 'pointsBalance') int? points,
    int? postedCount,
    int? claimedCount,
    int? completedCount,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
