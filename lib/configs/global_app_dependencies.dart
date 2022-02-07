import 'package:projects_template/blocs/home_cubit/home_cubit.dart';
import 'package:projects_template/blocs/login_cubit/login_cubit.dart';
import 'package:projects_template/blocs/register_cubit/register_cubit.dart';
import 'package:projects_template/services/helpers/hive_helper.dart';
import 'package:projects_template/services/local_datasources/auth/auth_impl_hive.dart';
import 'package:projects_template/services/remote_datasources/auth/auth_impl_firebase.dart';
import 'package:projects_template/services/remote_datasources/images_upload/images_upload_remote_ds_impl_firebase.dart';
import 'package:projects_template/services/remote_datasources/posts/posts_remote_ds_impl_firebase.dart';
import 'package:projects_template/services/remote_datasources/users/users_remote_ds_impl.dart';
import 'package:projects_template/services/repo/auth/auth_impl_firebase.dart';
import 'package:projects_template/services/repo/posts/posts_repo_impl_firebase.dart';
import 'package:projects_template/services/repo/users/users_repo_impl_firebase.dart';

import 'constants/hive.dart';

class GlobalAppDependencies {
  static dynamic CURRENT_USER =
      HiveHelper(HiveConstants.user).getWithKey(HiveConstants.user);
}
