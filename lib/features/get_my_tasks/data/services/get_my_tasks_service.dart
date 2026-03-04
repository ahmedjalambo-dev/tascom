import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/my_tasks_response.dart';

part 'get_my_tasks_service.g.dart';

@RestApi()
abstract class GetMyTasksService {
  factory GetMyTasksService(Dio dio) = _GetMyTasksService;

  @GET(ApiConstants.myTasks)
  Future<MyTasksResponse> getMyTasks();
}
