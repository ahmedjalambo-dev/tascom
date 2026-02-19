import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_result.dart';
import '../data/repos/profile_repo.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;

  ProfileCubit(this._profileRepo) : super(const ProfileState.initial());

  Future<void> getUser(String id) async {
    emit(const ProfileState.loading());

    final result = await _profileRepo.getUser(id);

    result.when(
      success: (user) => emit(ProfileState.loaded(user)),
      failure: (error) => emit(ProfileState.error(error)),
    );
  }
}
