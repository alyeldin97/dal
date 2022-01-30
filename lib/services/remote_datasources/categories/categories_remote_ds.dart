import 'package:projects_template/models/category.dart';

abstract class CategoriesRemoteDataSource {
  Future<List<CategoryModel>> getAllCategories();
}
