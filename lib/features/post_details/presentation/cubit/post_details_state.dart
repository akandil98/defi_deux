part of 'post_details_cubit.dart';

abstract class PostDetailsState extends Equatable {
  const PostDetailsState();

  @override
  List<Object> get props => [];
}

class PostDetailsInitial extends PostDetailsState {}

class ShowCommentsState extends PostDetailsState {
  final bool showComments;

  const ShowCommentsState({required this.showComments});
  @override
  List<Object> get props => [showComments];
}
