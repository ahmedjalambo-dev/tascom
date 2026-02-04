import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/update_user_request.dart';
import '../data/repos/user_repo.dart';
import '../../../../core/networking/api_result.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepo _userRepo;

  UserCubit(this._userRepo) : super(const UserState.initial());

  Future<void> getUser(String id) async {
    emit(const UserState.loading());

    final result = await _userRepo.getUser(id);

    result.when(
      success: (user) => emit(UserState.loaded(user)),
      failure: (error) => emit(UserState.error(error)),
    );
  }

  Future<void> updateUser(String id, UpdateUserRequest request) async {
    emit(const UserState.loading());

    final result = await _userRepo.updateUser(id, request);

    result.when(
      success: (user) => emit(UserState.updateSuccess(user)),
      failure: (error) => emit(UserState.error(error)),
    );
  }

  Future<void> deleteUser(String id) async {
    emit(const UserState.loading());

    final result = await _userRepo.deleteUser(id);

    result.when(
      success: (_) => emit(const UserState.deleteSuccess()),
      failure: (error) => emit(UserState.error(error)),
    );
  }
}
