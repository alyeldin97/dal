import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projects_template/configs/constants/api_urls.dart';
import 'package:projects_template/models/post/post.dart';
import 'package:projects_template/services/errors/failure.dart';
import 'package:projects_template/services/remote_datasources/posts/posts_remote_ds.dart';

class PostsRemoteDataSourceImplFirebase implements PostsRemoteDataSource {
  @override
  Future<List<PostModel>> getAllPostsByCategoryId(String categoryId) async {
    try {
      List<PostModel> postsModels = [];
      CollectionReference<Map<String, dynamic>> categoriesCollectionReference =
          FireBaseCollectionRefernces.categoriesCollection;

      var currentCategoryDoc = categoriesCollectionReference.doc(categoryId);

      CollectionReference<Map<String, dynamic>>
          currentCategoryPostsCollecntionReference =
          currentCategoryDoc.collection(FirebaseConstants.posts);

      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await currentCategoryPostsCollecntionReference.get();

      for (var doc in querySnapshot.docs) {
        var map = doc.data();
        postsModels.add(PostModel.fromMap(map));
      }

      return postsModels;
    } catch (e) {
      throw defaultFailure();
    }
  }
}
