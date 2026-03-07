import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/map_tasks_response.dart';

part 'map_service.g.dart';

@RestApi()
abstract class MapService {
  factory MapService(Dio dio) = _MapService;

  @GET(ApiConstants.tasksMap)
  Future<MapTasksResponse> getMapTasks();
}
