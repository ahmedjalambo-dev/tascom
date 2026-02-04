import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/networking/api_constants.dart';
import '../models/reset_password_request.dart';

part 'reset_password_service.g.dart';

@RestApi()
abstract class ResetPasswordService {
  factory ResetPasswordService(Dio dio) = _ResetPasswordService;

  @POST(ApiConstants.resetPassword)
  Future<void> resetPassword(@Body() ResetPasswordRequest request);
}
