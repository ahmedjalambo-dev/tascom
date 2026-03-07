import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/like_task_response.dart';

part 'like_task_service.g.dart';

@RestApi()
abstract class LikeTaskService {
  factory LikeTaskService(Dio dio) = _LikeTaskService;

  @POST('${ApiConstants.likeTask}/{id}')
  Future<LikeTaskResponse> likeTask(@Path('id') int id);
}
