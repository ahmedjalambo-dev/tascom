import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_person_data.freezed.dart';
part 'search_person_data.g.dart';

@freezed
abstract class SearchPersonData with _$SearchPersonData {
  const factory SearchPersonData({
    required String id,
    required String name,
    String? location,
    @JsonKey(name: 'ratingAvg') double? ratingAvg,
    String? skills,
    String? avatar,
    @Default(0) double distance,
  }) = _SearchPersonData;

  factory SearchPersonData.fromJson(Map<String, dynamic> json) =>
      _$SearchPersonDataFromJson(json);
}
