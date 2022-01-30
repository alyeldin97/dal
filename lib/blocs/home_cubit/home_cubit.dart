import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:projects_template/entities/post/post.dart';
import 'package:projects_template/services/errors/failure.dart';
import 'package:projects_template/services/repo/posts/posts_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  PostsRepo postsRepo;
  HomeCubit(this.postsRepo) : super(HomeInitial());

  void getAllPostsById(String categoryId) async {
    emit(HomeGetAllPostsLoadingState());
    Either<Failure, List<PostEntity>> eitherPostsOrFailures;
    eitherPostsOrFailures = await postsRepo.getAllPostsByCategoryId(categoryId);

    eitherPostsOrFailures
        .fold((failure) => emit(HomeGetAllPostsErrorState(failure: failure)),
            (posts) {
      emit(HomeGetAllPostsSuccessState(posts: posts));
    });
  }
}
