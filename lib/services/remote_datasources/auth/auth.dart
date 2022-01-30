import 'package:projects_template/entities/login.dart';
import 'package:projects_template/entities/register.dart';
import 'package:projects_template/entities/user.dart';
import 'package:projects_template/models/user.dart';

abstract class AuthRemoteDataSource {
  Future<String> signInWithEmailAndPassword(
      {required LoginUserEntity loginUserEntity});
  

  Future<UserModel?> signInWithGoogle();
  Future<UserModel?> signInWithFacebook();

  Future<UserModel> signUpWithEmailAndPassword(
      {required RegisterUserEntity registerUserEntity});
}
