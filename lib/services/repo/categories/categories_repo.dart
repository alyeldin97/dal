import 'package:dartz/dartz.dart';
import 'package:projects_template/entities/category.dart';
import 'package:projects_template/services/errors/failure.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories();
}
