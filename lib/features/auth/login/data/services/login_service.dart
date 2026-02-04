import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/networking/api_constants.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';

part 'login_service.g.dart';

@RestApi()
abstract class LoginService {
  factory LoginService(Dio dio) = _LoginService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequest request);
}
