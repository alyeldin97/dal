import 'package:dartz/dartz.dart';

import 'package:projects_template/entities/user.dart';
import 'package:projects_template/models/user.dart';
import 'package:projects_template/services/errors/failure.dart';
import 'package:projects_template/services/remote_datasources/users/users_remote_ds.dart';
import 'package:projects_template/services/repo/users/users_repo.dart';

class UsersRepoImplFirebase implements UsersRepo {
  UsersRemoteDataSource usersRemoteDataSource;
  UsersRepoImplFirebase({
    required this.usersRemoteDataSource,
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
