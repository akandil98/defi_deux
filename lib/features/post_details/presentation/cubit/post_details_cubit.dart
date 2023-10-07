import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'post_details_state.dart';

class PostDetailsCubit extends Cubit<PostDetailsState> {
  PostDetailsCubit() : super(PostDetailsInitial());

  bool showComments = false;

  void showCommentsFun({required bool showComments}) {
    emit(PostDetailsInitial());
    this.showComments = showComments;
    emit(ShowCommentsState(showComments: showComments));
  }
}
