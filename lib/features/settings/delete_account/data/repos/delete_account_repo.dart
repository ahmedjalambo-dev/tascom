import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../services/delete_account_service.dart';

class DeleteAccountRepo {
  final DeleteAccountService _deleteAccountService;

  DeleteAccountRepo(this._deleteAccountService);

  Future<ApiResult<void>> deleteAccount(String id) async {
    try {
      await _deleteAccountService.deleteUser(id);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
