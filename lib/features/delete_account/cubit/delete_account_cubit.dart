import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_result.dart';
import '../data/repos/delete_account_repo.dart';
import 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  final DeleteAccountRepo _deleteAccountRepo;

  DeleteAccountCubit(this._deleteAccountRepo)
      : super(const DeleteAccountState.initial());

  Future<void> deleteAccount(String id) async {
    emit(const DeleteAccountState.loading());

    final result = await _deleteAccountRepo.deleteAccount(id);

    result.when(
      success: (_) => emit(const DeleteAccountState.success()),
      failure: (error) => emit(DeleteAccountState.error(error)),
    );
  }
}