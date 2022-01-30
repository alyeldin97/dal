import 'package:dartz/dartz.dart';
import 'package:projects_template/entities/post/post.dart';
import 'package:projects_template/services/errors/failure.dart';

abstract class PostsRepo{
  Future<Either<Failure,List<PostEntity>>> getAllPostsByCategoryId(String categoryId);
}