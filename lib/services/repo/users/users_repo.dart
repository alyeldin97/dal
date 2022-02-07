import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:projects_template/entities/user.dart';
import 'package:projects_template/services/errors/failure.dart';

abstract class UsersRepo {
  Future<Either<Failure, void>> createUserInDatabase(UserEntity userEntity);
  Future<Either<Failure, void>> updateUserInDatabase(UserEntity userEntity,{File? pickedImage});

  Future<Either<Failure, UserEntity>> getUserFromDataBase(String id);
  Future<bool> userExists(String id);
}
