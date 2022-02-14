import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projects_template/configs/constants/api_urls.dart';
import 'package:projects_template/configs/constants/failure.dart';
import 'package:projects_template/models/post/post.dart';
import 'package:projects_template/services/errors/failure.dart';
import 'package:projects_template/services/remote_datasources/core/fire_base.dart';
import 'package:projects_template/services/remote_datasources/posts/posts_remote_ds.dart';

class PostsRemoteDataSourceImplFirebase implements PostsRemoteDataSource {
  @override
  Future<List<PostModel>> getAllPostsByCategoryId(String categoryId) async {
    try {
      List<PostModel> postsModels = [];

      CollectionReference<Map<String, dynamic>>
          currentCategoryPostsCollecntionReference =
          getCollectionFromDocumentInCollection(
              baseCollectionName: FireBaseCollectionRefernces.categories,
              docName: categoryId,
              childCollectionName: FireBaseCollectionRefernces.posts);


      List<QueryDocumentSnapshot<Map<String, dynamic>>> postsDocs =
          await getDocsFromCollection(currentCategoryPostsCollecntionReference);

      for (var postDoc in postsDocs) {
        var map = postDoc.data();
        postsModels.add(PostModel.fromMap(map));
      }

      return postsModels;
    } catch (e) {
      if (e is Failure && e.code == FailureCodes.socket) {
        rethrow;
      } else {
        throw defaultFailure();
      }
    }
  }
}
