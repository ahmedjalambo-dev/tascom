import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/save_task_response.dart';

part 'save_task_service.g.dart';

@RestApi()
abstract class SaveTaskService {
  factory SaveTaskService(Dio dio) = _SaveTaskService;

  @POST('${ApiConstants.saveTask}/{id}')
  Future<SaveTaskResponse> saveTask(@Path('id') int id);
}
