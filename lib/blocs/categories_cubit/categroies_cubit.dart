import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:projects_template/entities/category.dart';
import 'package:projects_template/services/errors/failure.dart';
import 'package:projects_template/services/repo/categories/categories_repo.dart';

part 'categroies_state.dart';

class CategroiesCubit extends Cubit<CategroiesState> {
  CategroiesCubit(this.categoriesRepo) : super(CategroiesInitial());

  CategoriesRepo categoriesRepo;
  List<CategoryEntity> categories = [];

  void getAllCategories() async {
    emit(CategroiesGetAllCategriesLoadingState());
    Either<Failure, List<CategoryEntity>> eitherCategroiesEntitiesOrFailure =
        await categoriesRepo.getAllCategories();

    eitherCategroiesEntitiesOrFailure.fold(
        (failure) =>
            emit(CategroiesGetAllCategriesErrorState(failure: failure)),
        (categoriesEntities) {
      categories = categoriesEntities;
      emit(CategroiesGetAllCategriesSuccessState(
          categoriesEntities: categoriesEntities));
    });
  }
}
