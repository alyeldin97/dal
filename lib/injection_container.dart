import 'package:get_it/get_it.dart';
import 'package:projects_template/blocs/categories_cubit/categroies_cubit.dart';
import 'package:projects_template/blocs/home_cubit/home_cubit.dart';
import 'package:projects_template/blocs/layout_cubit/layout_cubit.dart';
import 'package:projects_template/blocs/onboarding/onboarding_cubit.dart';
import 'package:projects_template/blocs/profile_cubit/profile_cubit.dart';
import 'package:projects_template/blocs/register_cubit/register_cubit.dart';
import 'package:projects_template/configs/constants/get_it.dart';
import 'package:projects_template/configs/constants/hive.dart';
import 'package:projects_template/services/helpers/hive_helper.dart';
import 'package:projects_template/services/local_datasources/auth/auth.dart';
import 'package:projects_template/services/local_datasources/auth/auth_impl_hive.dart';
import 'package:projects_template/services/local_datasources/onboarding/onboarding.dart';
import 'package:projects_template/services/local_datasources/onboarding/onboarding_impl.dart';
import 'package:projects_template/services/remote_datasources/auth/auth.dart';
import 'package:projects_template/services/remote_datasources/auth/auth_impl_firebase.dart';
import 'package:projects_template/services/remote_datasources/categories/categories_remote_ds.dart';
import 'package:projects_template/services/remote_datasources/categories/categories_remote_ds_impl_firebase.dart';
import 'package:projects_template/services/remote_datasources/images_upload/images_upload_remote_ds.dart';
import 'package:projects_template/services/remote_datasources/images_upload/images_upload_remote_ds_impl_firebase.dart';
import 'package:projects_template/services/remote_datasources/posts/posts_remote_ds.dart';
import 'package:projects_template/services/remote_datasources/posts/posts_remote_ds_impl_firebase.dart';
import 'package:projects_template/services/remote_datasources/users/users_remote_ds.dart';
import 'package:projects_template/services/remote_datasources/users/users_remote_ds_impl.dart';
import 'package:projects_template/services/repo/auth/auth.dart';
import 'package:projects_template/services/repo/auth/auth_impl_firebase.dart';
import 'package:projects_template/services/repo/categories/categories_repo.dart';
import 'package:projects_template/services/repo/categories/categories_repo_impl_firebase.dart';
import 'package:projects_template/services/repo/onboarding/onboarding.dart';
import 'package:projects_template/services/repo/onboarding/onboarding_impl.dart';
import 'package:projects_template/services/repo/posts/posts_repo.dart';
import 'package:projects_template/services/repo/posts/posts_repo_impl_firebase.dart';
import 'package:projects_template/services/repo/users/users_repo.dart';
import 'package:projects_template/services/repo/users/users_repo_impl_firebase.dart';
import 'package:projects_template/blocs/login_cubit/login_cubit.dart';

final GetIt sl = GetIt.instance();

void initGetIt() {
  //^ Remote Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceFirebaseImpl(),
  );
  sl.registerLazySingleton<CategoriesRemoteDataSource>(
    () => CategoriesRemoteDataSourceImplFirebase(),
  );
  sl.registerLazySingleton<ImageUploadRemoteDataSource>(
    () => ImageUploadRemoteDataSourceFirebaseImpl(),
  );
  sl.registerLazySingleton<PostsRemoteDataSource>(
    () => PostsRemoteDataSourceImplFirebase(),
  );
  sl.registerLazySingleton<UsersRemoteDataSource>(
    () => UsersRemoteDataSourceImplFirebase(),
  );
  //^ Local Data Sources
  sl.registerLazySingleton<HiveHelper>(() => HiveHelper(HiveConstants.user),
      instanceName: HiveConstants.user);
  sl.registerLazySingleton<HiveHelper>(
      () => HiveHelper(HiveConstants.onboarding),
      instanceName: HiveConstants.onboarding);

  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImplHive(
      sl.get(instanceName: HiveConstants.user),
    ),
  );
  sl.registerLazySingleton<OnboardingLocalDataSource>(
    () => OnboardingLocalDataSourceImpl(
      sl.get(instanceName: HiveConstants.onboarding),
    ),
  );

  //^ Repos
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoFirebaseImpl(sl(), sl(), sl()),
  );
  sl.registerLazySingleton<CategoriesRepo>(
    () => CategoriesRepoImplFirebase(sl()),
  );
  sl.registerLazySingleton<OnboardingRepo>(
    () => OnboardingRepoImpl(sl()),
  );
  sl.registerLazySingleton<PostsRepo>(
    () => PostsRepoImplFirebase(sl()),
  );
  sl.registerLazySingleton<UsersRepo>(
    () => UsersRepoImplFirebase(
        usersRemoteDataSource: sl(), imageUploadRemoteDataSource: sl()),
  );

  //^Cubits
  sl.registerFactory<CategroiesCubit>(() => CategroiesCubit(
        sl(),
      ),instanceName: GetItConstants.categoryCubit);
  sl.registerFactory<HomeCubit>(() => HomeCubit(
        sl(),
      ),instanceName: GetItConstants.homeCubit);

  sl.registerFactory<LayoutCubit>(() => LayoutCubit(),
      instanceName: GetItConstants.layOutCubit);
  sl.registerFactory<LoginCubit>(() => LoginCubit(
        sl(),
      ),instanceName: GetItConstants.loginCubit);
  sl.registerFactory<RegisterCubit>(() => RegisterCubit(sl(), sl()),instanceName: GetItConstants.registerCubit);
  sl.registerFactory<ProfileCubit>(() => ProfileCubit(
        sl(),
      ),instanceName: GetItConstants.profileCubit);
  sl.registerFactory<OnboardingCubit>(() => OnboardingCubit(
        sl(),
      ),instanceName: GetItConstants.onBoardingCubit);
}
