import 'package:dartz/dartz.dart';
import 'package:projects_template/entities/user.dart';
import 'package:projects_template/entities/register.dart';
import 'package:projects_template/entities/login.dart';
import 'package:projects_template/models/user.dart';
import 'package:projects_template/services/errors/failure.dart';
import 'package:projects_template/services/local_datasources/auth/auth.dart';
import 'package:projects_template/services/remote_datasources/auth/auth.dart';
import 'package:projects_template/services/remote_datasources/users/users_remote_ds.dart';
import 'auth.dart';

class AuthRepoFirebaseImpl implements AuthRepo {
  AuthRemoteDataSource authRemoteDataSource;
  AuthLocalDataSource authLocalDataSource;
  UsersRemoteDataSource usersRemoteDataSource;

  AuthRepoFirebaseImpl(this.authRemoteDataSource,
      this.authLocalDataSource, this.usersRemoteDataSource);
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      {required LoginUserEntity loginUserEntity}) async {
    try {
      String id = await authRemoteDataSource
          .signInWithEmailAndPassword(loginUserEntity: loginUserEntity);
      UserModel userModel =
          await usersRemoteDataSource.getUserFromDataBase(id);

      return right(userModel.toEntity());
    } on Failure catch (failure) {
      return left(failure);
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> signInWithFacebook() async {
    try {
      UserModel? userModel =
          await authRemoteDataSource.signInWithFacebook();
       bool userExistsInFireStore =
          await usersRemoteDataSource.userExists(userModel!.id);

      if (userExistsInFireStore) {
        userModel = await usersRemoteDataSource
            .getUserFromDataBase(userModel.id);
        return right(userModel.toEntity());
      } else {
        await usersRemoteDataSource.createUserInDatabase(userModel);
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
          await authRemoteDataSource.signInWithGoogle();
      bool userExistsInFireStore =
          await usersRemoteDataSource.userExists(userModel!.id);

      if (userExistsInFireStore) {
        userModel = await usersRemoteDataSource
            .getUserFromDataBase(userModel.id);
        return right(userModel.toEntity());
      } else {
        await usersRemoteDataSource.createUserInDatabase(userModel);
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
      UserModel userModel = await authRemoteDataSource
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
