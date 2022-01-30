import 'package:dartz/dartz.dart';
import 'package:projects_template/entities/user.dart';

import 'package:projects_template/entities/register.dart';

import 'package:projects_template/entities/login.dart';
import 'package:projects_template/models/user.dart';
import 'package:projects_template/services/errors/failure.dart';
import 'package:projects_template/services/local_datasources/auth/auth.dart';
import 'package:projects_template/services/remote_datasources/auth/auth_impl_firebase.dart';
import 'package:projects_template/services/remote_datasources/users/users_remote_ds_impl.dart';

import 'auth.dart';

class AuthRepoFirebaseImpl implements AuthRepo {
  AuthRemoteDataSourceFirebaseImpl authRemoteDataSourceFirebaseImpl;
  AuthLocalDataSource authLocalDataSource;
  UsersRemoteDataSourceImplFirebase usersRemoteDataSourceImplFirebase;

  AuthRepoFirebaseImpl(this.authRemoteDataSourceFirebaseImpl,
      this.authLocalDataSource, this.usersRemoteDataSourceImplFirebase);
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      {required LoginUserEntity loginUserEntity}) async {
    try {
      String id = await authRemoteDataSourceFirebaseImpl
          .signInWithEmailAndPassword(loginUserEntity: loginUserEntity);

      UserModel userModel =
          await usersRemoteDataSourceImplFirebase.getUserFromDataBase(id);

      return right(userModel.toEntity());
    } on Failure catch (failure) {
      return left(failure);
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> signInWithFacebook() async {
    try {
      UserModel? userModel =
          await authRemoteDataSourceFirebaseImpl.signInWithFacebook();
       bool userExistsInFireStore =
          await usersRemoteDataSourceImplFirebase.userExists(userModel!.id);

      if (userExistsInFireStore) {
        userModel = await usersRemoteDataSourceImplFirebase
            .getUserFromDataBase(userModel.id);
        return right(userModel.toEntity());
      } else {
        await usersRemoteDataSourceImplFirebase.createUserInDatabase(userModel);
        return right(userModel.toEntity());
      }
    } on Failure catch (failure) {
      return left(failure);
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> signInWithGoogle() async {
    try {
      UserModel? userModel =
          await authRemoteDataSourceFirebaseImpl.signInWithGoogle();
      bool userExistsInFireStore =
          await usersRemoteDataSourceImplFirebase.userExists(userModel!.id);

      if (userExistsInFireStore) {
        userModel = await usersRemoteDataSourceImplFirebase
            .getUserFromDataBase(userModel.id);
        return right(userModel.toEntity());
      } else {
        await usersRemoteDataSourceImplFirebase.createUserInDatabase(userModel);
        return right(userModel.toEntity());
      }
    } on Failure catch (failure) {
      return left(failure);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword(
      {required RegisterUserEntity registerUserEntity}) async {
    try {
      UserModel userModel = await authRemoteDataSourceFirebaseImpl
          .signUpWithEmailAndPassword(registerUserEntity: registerUserEntity);
      return right(userModel.toEntity());
    } on Failure catch (failure) {
      return left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> cacheUser(UserEntity userEntity) async {
    try {
      await authLocalDataSource.cacheUser(userEntity);
      return right(null);
    } on Failure catch (failure) {
      return left(failure);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCachedUser() async {
    try {
      UserEntity userEntity = await authLocalDataSource.getCachedUser();
      return right(userEntity);
    } on Failure catch (failure) {
      return left(failure);
    }
  }
}
