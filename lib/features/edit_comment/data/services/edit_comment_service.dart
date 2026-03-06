import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/edit_comment_request.dart';
import '../models/edit_comment_response.dart';

part 'edit_comment_service.g.dart';

@RestApi()
abstract class EditCommentService {
  factory EditCommentService(Dio dio) = _EditCommentService;

  @PATCH('${ApiConstants.comments}/{id}')
  Future<EditCommentResponse> editComment(
    @Path('id') int id,
    @Body() EditCommentRequest request,
  );
}
