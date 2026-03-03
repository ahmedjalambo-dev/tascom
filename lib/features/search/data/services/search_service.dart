import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';

part 'search_service.g.dart';

@RestApi()
abstract class SearchService {
  factory SearchService(Dio dio) = _SearchService;

  @GET(ApiConstants.search)
  @DioResponseType(ResponseType.json)
  Future<dynamic> search({
    @Query('type') required String type,
    @Query('query') String? query,
    @Query('mode') String? mode,
    @Query('category') String? category,
    @Query('categories') String? categories,
    @Query('priority') String? priority,
    @Query('priorities') String? priorities,
    @Query('minPoints') int? minPoints,
    @Query('maxPoints') int? maxPoints,
    @Query('minRating') double? minRating,
    @Query('maxRating') double? maxRating,
    @Query('minDistance') int? minDistance,
    @Query('maxDistance') int? maxDistance,
    @Query('userLat') double? userLat,
    @Query('userLng') double? userLng,
    @Query('page') int? page,
    @Query('limit') int? limit,
  });
}
