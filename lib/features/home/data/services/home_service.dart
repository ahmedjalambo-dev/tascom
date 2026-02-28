import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/all_tasks_response.dart';

part 'home_service.g.dart';

@RestApi()
abstract class HomeService {
  factory HomeService(Dio dio) = _HomeService;

  @GET(ApiConstants.tasks)
  Future<AllTasksResponse> getAllTasks(
    @Query('page') int page,
    @Query('limit') int limit,
  );
}
