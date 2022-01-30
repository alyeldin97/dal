part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}
class HomeGetAllPostsLoadingState extends HomeState {}
class HomeGetAllPostsSuccessState extends HomeState {
  List<PostEntity> posts;
  HomeGetAllPostsSuccessState({
    required this.posts,
  });
}

class HomeGetAllPostsErrorState extends HomeState {
  Failure failure;
  HomeGetAllPostsErrorState({
    required this.failure,
  });
}



