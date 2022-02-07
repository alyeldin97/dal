import 'package:projects_template/models/user.dart';

abstract class UsersRemoteDataSource {
  Future<void> createUserInDatabase(UserModel userModel);
  Future<void> updateUserInDatabase(UserModel userModel);
  Future<UserModel> getUserFromDataBase(String id);
  Future<bool> userExists(String id);
}
