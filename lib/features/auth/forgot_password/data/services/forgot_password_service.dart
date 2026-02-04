import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/networking/api_constants.dart';
import '../models/forgot_password_request.dart';

part 'forgot_password_service.g.dart';

@RestApi()
abstract class ForgotPasswordService {
  factory ForgotPasswordService(Dio dio) = _ForgotPasswordService;

  @POST(ApiConstants.forgotPassword)
  Future<void> forgotPassword(@Body() ForgotPasswordRequest request);
}
