import 'package:projects_template/configs/constants/hive.dart';
import 'package:projects_template/entities/user.dart';
import 'package:projects_template/services/errors/failure.dart';
import 'package:projects_template/services/helpers/hive_helper.dart';
import 'package:projects_template/services/local_datasources/auth/auth.dart';

class AuthLocalDataSourceImplHive implements AuthLocalDataSource {
  HiveHelper hiveHelper;
  AuthLocalDataSourceImplHive(
    this.hiveHelper,
  );
  @override
  Future<void> cacheUser(UserEntity userEntity) async {
    try {
      hiveHelper.addWithKey(userEntity, HiveConstants.user);
    } catch (e) {
      throw defaultFailure();
    }
  }

  @override
  Future<UserEntity> getCachedUser() async{
    try{
     dynamic user = await hiveHelper.getWithKey(HiveConstants.user);
     return user as UserEntity;
    }catch(e){
      throw defaultFailure();
    }
  }
}
