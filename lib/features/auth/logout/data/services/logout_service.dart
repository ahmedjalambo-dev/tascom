import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/networking/api_constants.dart';

part 'logout_service.g.dart';

@RestApi()
abstract class LogoutService {
  factory LogoutService(Dio dio) = _LogoutService;

  @POST(ApiConstants.logout)
  Future<void> logout();
}
