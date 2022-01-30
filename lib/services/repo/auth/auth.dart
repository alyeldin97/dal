import 'package:dartz/dartz.dart';
import 'package:projects_template/entities/login.dart';
import 'package:projects_template/entities/register.dart';
import 'package:projects_template/entities/user.dart';
import 'package:projects_template/models/user.dart';
import 'package:projects_template/services/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure,UserEntity>> signInWithEmailAndPassword(
      {required LoginUserEntity loginUserEntity});
  Future<Either<Failure,UserEntity?>> signInWithGoogle();
  Future<Either<Failure,UserEntity?>> signInWithFacebook();
  Future<Either<Failure,void>> cacheUser(UserEntity userEntity);
  Future<Either<Failure,UserEntity>> getCachedUser();


  Future<Either<Failure,UserEntity>> signUpWithEmailAndPassword(
      {required RegisterUserEntity registerUserEntity});
}
