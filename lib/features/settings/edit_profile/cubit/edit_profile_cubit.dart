import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../data/models/update_user_request.dart';
import '../data/repos/edit_profile_repo.dart';
import 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileRepo _editProfileRepo;

  EditProfileCubit(this._editProfileRepo)
    : super(const EditProfileState.initial());

  Future<void> getUser(String id) async {
    emit(const EditProfileState.loading());

    final result = await _editProfileRepo.getUser(id);

    result.when(
      success: (user) => emit(EditProfileState.loaded(user)),
      failure: (error) => emit(EditProfileState.error(error)),
    );
  }

  Future<void> updateUser(String id, UpdateUserRequest request) async {
    emit(const EditProfileState.loading());

    final result = await _editProfileRepo.updateUser(id, request);

    result.when(
      success: (user) => emit(EditProfileState.updateSuccess(user)),
      failure: (error) => emit(EditProfileState.error(error)),
    );
  }
}
