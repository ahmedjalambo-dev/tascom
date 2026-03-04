import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/my_claims_response.dart';

part 'get_my_claims_service.g.dart';

@RestApi()
abstract class GetMyClaimsService {
  factory GetMyClaimsService(Dio dio) = _GetMyClaimsService;

  @GET(ApiConstants.myClaims)
  Future<MyClaimsResponse> getMyClaims();
}
