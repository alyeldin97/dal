import 'package:projects_template/models/post/post.dart';

abstract class PostsRemoteDataSource{
  Future<List<PostModel>> getAllPostsByCategoryId(String categoryId);
}