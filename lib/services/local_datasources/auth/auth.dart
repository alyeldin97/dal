import 'package:projects_template/entities/user.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(UserEntity userEntity);
  Future<UserEntity> getCachedUser();
}
