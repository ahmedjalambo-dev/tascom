import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/networking/api_constants.dart';

part 'delete_account_service.g.dart';

@RestApi()
abstract class DeleteAccountService {
  factory DeleteAccountService(Dio dio) = _DeleteAccountService;

  @DELETE('${ApiConstants.users}/{id}')
  Future<void> deleteUser(@Path('id') String id);
}