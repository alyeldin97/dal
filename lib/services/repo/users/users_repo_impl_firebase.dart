import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:projects_template/entities/user.dart';
import 'package:projects_template/models/user.dart';
import 'package:projects_template/services/errors/failure.dart';
import 'package:projects_template/services/remote_datasources/images_upload/images_upload_remote_ds.dart';
import 'package:projects_template/services/remote_datasources/users/users_remote_ds.dart';
import 'package:projects_template/services/repo/users/users_repo.dart';
import 'package:projects_template/views/splash_screen/splash_screen.dart';

class UsersRepoImplFirebase implements UsersRepo {
  UsersRemoteDataSource usersRemoteDataSource;
  ImageUploadRemoteDataSource imageUploadRemoteDataSource;

  UsersRepoImplFirebase({
    required this.usersRemoteDataSource,
    required this.imageUploadRemoteDataSource,
  });

  @override
  Future<Either<Failure, void>> createUserInDatabase(
      UserEntity userEntity) async {
    try {
      await usersRemoteDataSource
          .createUserInDatabase(UserModel.fromEntity(userEntity));
      return right(null);
    } on Failure catch (failure) {
      return left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> updateUserInDatabase(UserEntity userEntity,
      {File? pickedImage}) async {
    try {
      bool uploadWithImage = pickedImage != null;
      if (uploadWithImage) {
        String imageUrl =
            await imageUploadRemoteDataSource.uploadImage(pickedImage);
        userEntity = userEntity.copyWith(imageUrl: imageUrl);
      }
      await usersRemoteDataSource
          .updateUserInDatabase(UserModel.fromEntity(userEntity));

      CURRENT_USER = userEntity;
      return right(null);
    } on Failure catch (failure) {
      return left(failure);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserFromDataBase(String id) async {
    try {
      UserModel userModel = await usersRemoteDataSource.getUserFromDataBase(id);
      return right(userModel.toEntity());
    } on Failure catch (failure) {
      return left(failure);
    }
  }

  @override
  Future<bool> userExists(String id) async {
    return await usersRemoteDataSource.userExists(id);
  }
}
