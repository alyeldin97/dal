part of 'categroies_cubit.dart';

abstract class CategroiesState extends Equatable {
  const CategroiesState();

  @override
  List<Object> get props => [];
}

class CategroiesInitial extends CategroiesState {}

class CategroiesGetAllCategriesLoadingState extends CategroiesState {}

class CategroiesGetAllCategriesSuccessState extends CategroiesState {
  List<CategoryEntity> categoriesEntities;
  CategroiesGetAllCategriesSuccessState({
    required this.categoriesEntities,
  });
}
class CategroiesGetAllCategriesErrorState extends CategroiesState {
  Failure failure;
  CategroiesGetAllCategriesErrorState({
    required this.failure,
  });
}


