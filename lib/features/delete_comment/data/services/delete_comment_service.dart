import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/delete_comment_response.dart';

part 'delete_comment_service.g.dart';

@RestApi()
abstract class DeleteCommentService {
  factory DeleteCommentService(Dio dio) = _DeleteCommentService;

  @DELETE('${ApiConstants.comments}/{id}')
  Future<DeleteCommentResponse> deleteComment(@Path('id') int id);
}
