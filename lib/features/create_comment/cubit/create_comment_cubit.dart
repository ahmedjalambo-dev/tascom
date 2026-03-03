import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_result.dart';
import '../data/models/create_comment_request.dart';
import '../data/repos/create_comment_repo.dart';
import 'create_comment_state.dart';

class CreateCommentCubit extends Cubit<CreateCommentState> {
  final CreateCommentRepo _repo;

  CreateCommentCubit(this._repo) : super(const CreateCommentState.initial());

  Future<void> createComment(CreateCommentRequest request) async {
    emit(const CreateCommentState.loading());

    final result = await _repo.createComment(request);

    switch (result) {
      case Success(data: final response):
        if (response.data != null) {
          emit(CreateCommentState.success(response.data!));
        }
      case Failure(error: final error):
        emit(CreateCommentState.error(error));
    }
  }

  void reset() => emit(const CreateCommentState.initial());
}
