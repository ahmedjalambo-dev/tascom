import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/comment_response.dart';

part 'get_comments_service.g.dart';

@RestApi()
abstract class GetCommentsService {
  factory GetCommentsService(Dio dio) = _GetCommentsService;

  @GET('${ApiConstants.commentsTask}/{taskId}')
  Future<GetCommentsResponse> getTaskComments(@Path('taskId') int taskId);
}
