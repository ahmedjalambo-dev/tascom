import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_meta.freezed.dart';
part 'search_meta.g.dart';

@freezed
abstract class SearchMeta with _$SearchMeta {
  const factory SearchMeta({
    required int total,
    required int page,
    required int limit,
  }) = _SearchMeta;

  factory SearchMeta.fromJson(Map<String, dynamic> json) =>
      _$SearchMetaFromJson(json);
}
