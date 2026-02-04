import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/networking/api_constants.dart';
import '../../../login/data/models/login_response.dart';
import '../models/google_login_request.dart';

part 'google_login_service.g.dart';

@RestApi()
abstract class GoogleLoginService {
  factory GoogleLoginService(Dio dio) = _GoogleLoginService;

  @POST(ApiConstants.googleLogin)
  Future<LoginResponse> googleLogin(@Body() GoogleLoginRequest request);
}
