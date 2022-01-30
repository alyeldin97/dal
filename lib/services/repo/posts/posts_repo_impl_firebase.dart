import 'package:dartz/dartz.dart';
import 'package:projects_template/entities/post/post.dart';
import 'package:projects_template/models/post/post.dart';
import 'package:projects_template/services/errors/failure.dart';
import 'package:projects_template/services/remote_datasources/posts/posts_remote_ds.dart';
import 'package:projects_template/services/repo/posts/posts_repo.dart';

class PostsRepoImplFirebase implements PostsRepo {
  PostsRemoteDataSource postsRemoteDataSource;
  PostsRepoImplFirebase(
    this.postsRemoteDataSource,
  );

  @override
  Future<Either<Failure, List<PostEntity>>> getAllPostsByCategoryId(
      String categoryId) async {
    try {
      List<PostEntity> posts = [];
      List<PostModel> postsModels =
          await postsRemoteDataSource.getAllPostsByCategoryId(categoryId);
      for (var postModel in postsModels) {
        posts.add(postModel.toEntity());
      }
      return right(posts);
    } on Failure catch (failure) {
      return left(failure);
    }
  }
}
