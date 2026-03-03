import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/create_comment_request.dart';
import '../models/create_comment_response.dart';

part 'create_comment_service.g.dart';

@RestApi()
abstract class CreateCommentService {
  factory CreateCommentService(Dio dio) = _CreateCommentService;

  @POST(ApiConstants.comments)
  Future<CreateCommentResponse> createComment(
    @Body() CreateCommentRequest request,
  );
}
