import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/claim_task_response.dart';

part 'claim_task_service.g.dart';

@RestApi()
abstract class ClaimTaskService {
  factory ClaimTaskService(Dio dio) = _ClaimTaskService;

  @POST(ApiConstants.taskClaims)
  Future<ClaimTaskResponse> claimTask(@Body() Map<String, dynamic> body);
}
