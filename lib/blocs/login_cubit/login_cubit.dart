import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:projects_template/entities/login.dart';
import 'package:projects_template/entities/user.dart';
import 'package:projects_template/services/errors/failure.dart';
import 'package:projects_template/services/repo/auth/auth.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  AuthRepo authRepo;
  //UsersRepo usersRepo;

  bool isPasswordVisibile = false;
  bool rememberMeChecked = false;
  LoginUserEntity? loginUserEntity;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void startValidating() {
    autovalidateMode = AutovalidateMode.always;
    emit(LoginStartValidationState());
  }

  void rememberMeToggled() {
    rememberMeChecked = !rememberMeChecked;
    emit(LoginRememberMeToggledState(rememberMeChecked));
  }

  void passwordVisibilityToggled() {
    isPasswordVisibile = !isPasswordVisibile;
    emit(LoginPasswordVisibilityToggledState(isPasswordVisibile));
  }

  void signInWithEmailAndPassword(LoginUserEntity loginUserEntity) async {
    emit(LoginSignInWithEmailAndPasswordLoading());
    Either<Failure, UserEntity> eitherUserOrFailure = await authRepo
        .signInWithEmailAndPassword(loginUserEntity: loginUserEntity);

    eitherUserOrFailure
        .fold((failure) => emit(LoginSignInWithEmailAndPasswordError(failure)),
            (userEntity) async {
      await _cacheUserIfRememberMeIsChecked(userEntity);
      emit(LoginSignInWithEmailAndPasswordSuccess(userEntity: userEntity));
    });
  }

  void signInWithGoogle() async {
    emit(LoginSignInWithGoogleLoading());
    Either<Failure, UserEntity?> eitherUserOrFailure =
        await authRepo.signInWithGoogle();

    eitherUserOrFailure
        .fold((failure) => emit(LoginSignInWithGoogleError(failure)),
            (userEntity) async {
      if (userEntity != null) {
        await _cacheUserIfRememberMeIsChecked(userEntity);
        emit(LoginSignInWithFacebookSuccess(userEntity: userEntity));

      } else {
        emit(GoogleOrFacebookLoginCancelled());
      }
    });
  }

  void signInWithFacebook() async {
    emit(LoginSignInWithFacebookLoading());
    Either<Failure, UserEntity?> eitherUserOrFailure =
        await authRepo.signInWithFacebook();

    eitherUserOrFailure
        .fold((failure) => emit(LoginSignInWithFacebookError(failure)),
            (userEntity) async {
      if (userEntity != null) {
        await _cacheUserIfRememberMeIsChecked(userEntity);
        emit(LoginSignInWithGoogleSuccess(userEntity: userEntity));
      } else {
        emit(GoogleOrFacebookLoginCancelled());
      }
    });
  }

  Future _cacheUserIfRememberMeIsChecked(UserEntity userEntity) async {
    if (rememberMeChecked) {
      authRepo.cacheUser(userEntity);
    }
  }
}
