import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projects_template/configs/constants/api_urls.dart';
import 'package:projects_template/models/category.dart';
import 'package:projects_template/services/errors/failure.dart';

import 'categories_remote_ds.dart';

class CategoriesRemoteDataSourceImplFirebase
    implements CategoriesRemoteDataSource {
  @override
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      List<CategoryModel> categoryModels = [];
      CollectionReference<Map<String, dynamic>> categoriesCollectionReference =
          FireBaseCollectionRefernces.categoriesCollection;

      QuerySnapshot querySnapshot = await categoriesCollectionReference.get();

      for (var doc in querySnapshot.docs) {
        var map = doc.data() as Map<String, dynamic>;
        categoryModels.add(CategoryModel.fromMap(map));
      }
      return categoryModels;
    } catch (e) {
      throw defaultFailure();
    }
  }
}
