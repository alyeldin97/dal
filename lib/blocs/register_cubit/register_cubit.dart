import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:projects_template/entities/register.dart';
import 'package:projects_template/entities/user.dart';
import 'package:projects_template/services/errors/failure.dart';
import 'package:projects_template/services/repo/auth/auth.dart';
import 'package:projects_template/services/repo/users/users_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  UsersRepo usersRepo;
  AuthRepo authRepo;

  RegisterCubit(this.usersRepo, this.authRepo) : super(RegisterInitial());

  bool isPasswordVisibile = false;
  RegisterUserEntity? registerUserEntity;
   AutovalidateMode autovalidateMode=AutovalidateMode.disabled;

  void startValidating(){
    autovalidateMode=AutovalidateMode.always;
    emit(RegisterStartValidationState());

  }

  void passwordVisibilityToggled() {
    isPasswordVisibile = !isPasswordVisibile;
    emit(RegisterPasswordVisibilityToggledState(isPasswordVisibile));
  }

  void signUpWithEmailAndPassword(RegisterUserEntity registerUserEntity) async {
    emit(RegisterWithEmailAndPasswordLoading());
    Either<Failure, UserEntity> eitherUserOrFailure = await authRepo
        .signUpWithEmailAndPassword(registerUserEntity: registerUserEntity);

    eitherUserOrFailure.fold(
        (failure) =>
            emit(RegisterWithEmailAndPasswordFailure(failure: failure)),
        (userEntity) async {
      await _createUserInDataBase(userEntity);
      await _cacheUser(userEntity);

      emit(RegisterWithEmailAndPasswordSuccess(userEntity: userEntity));
    });
  }

  Future _cacheUser(userEntity) async {
    authRepo.cacheUser(userEntity);
  }

  Future _createUserInDataBase(UserEntity userEntity) async {
    await usersRepo.createUserInDatabase(userEntity).then(
        (eitherSuccessOrFailure) => eitherSuccessOrFailure.fold(
            (failure) =>
                emit(RegisterWithEmailAndPasswordFailure(failure: failure)),
            (r) => null));
  }

  //Events
  //1-toggle visibilty
  //2-sign up pressed
}
