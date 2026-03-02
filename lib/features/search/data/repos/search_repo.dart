import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../models/search_response.dart';
import '../services/search_service.dart';

class SearchRepo {
  final SearchService _service;

  SearchRepo(this._service);

  Future<ApiResult<SearchResponse>> search({
    required String type,
    String? query,
    String? mode,
    String? category,
    String? categories,
    String? priority,
    String? priorities,
    int? minPoints,
    int? maxPoints,
    double? minRating,
    double? maxRating,
    int? minDistance,
    int? maxDistance,
    double? userLat,
    double? userLng,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final json = await _service.search(
        type: type,
        query: query,
        mode: mode,
        category: category,
        categories: categories,
        priority: priority,
        priorities: priorities,
        minPoints: minPoints,
        maxPoints: maxPoints,
        minRating: minRating,
        maxRating: maxRating,
        minDistance: minDistance,
        maxDistance: maxDistance,
        userLat: userLat,
        userLng: userLng,
        page: page,
        limit: limit,
      );
      final response =
          SearchResponse.fromJson(json as Map<String, dynamic>);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
