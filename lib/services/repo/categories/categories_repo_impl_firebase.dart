import 'package:dartz/dartz.dart';
import 'package:projects_template/entities/category.dart';
import 'package:projects_template/models/category.dart';
import 'package:projects_template/services/errors/failure.dart';
import 'package:projects_template/services/remote_datasources/categories/categories_remote_ds.dart';

import 'categories_repo.dart';

class CategoriesRepoImplFirebase implements CategoriesRepo {
  CategoriesRemoteDataSource categoriesRemoteDataSource;
  CategoriesRepoImplFirebase(
    this.categoriesRemoteDataSource,
  );
  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    try {
      List<CategoryEntity> categoriesEntities = [];
      List<CategoryModel> categoriesModels =
          await categoriesRemoteDataSource.getAllCategories();
      for (var categoryModel in categoriesModels) {
        categoriesEntities.add(categoryModel.toEntity());
      }
      return right(categoriesEntities);
    } on Failure catch (failure) {
      return left(failure);
    }
  }
}
