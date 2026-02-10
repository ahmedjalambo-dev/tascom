import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/networking/api_constants.dart';
import '../models/register_request.dart';
import '../models/register_response.dart';

part 'register_service.g.dart';

@RestApi()
abstract class RegisterService {
  factory RegisterService(Dio dio) = _RegisterService;

  @POST(ApiConstants.register)
  Future<RegisterResponse> register(@Body() RegisterRequest request);
}
