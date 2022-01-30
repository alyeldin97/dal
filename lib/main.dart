import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:projects_template/configs/constants/hive.dart';
import 'package:projects_template/entities/user.dart';
import 'package:projects_template/models/category.dart';
import 'package:projects_template/models/user.dart';
import 'package:projects_template/my_app.dart';
import 'package:projects_template/services/helpers/hive_helper.dart';
import 'package:projects_template/services/remote_datasources/posts/posts_remote_ds_impl_firebase.dart';
import 'package:projects_template/services/remote_datasources/users/users_remote_ds.dart';
import 'package:projects_template/services/remote_datasources/users/users_remote_ds_impl.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/configs/bloc_observer.dart';
import 'package:bloc/bloc.dart';
import 'package:projects_template/views/utils/convertors.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'configs/constants/api_urls.dart';
import 'entities/post/review.dart';

void main() async {
  await initHive();
  WidgetsFlutterBinding.ensureInitialized();
  setStatusBarColor();
  await Firebase.initializeApp();
  await tester();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  initBlocObserverAndRunApp();
}

Future tester() async {
//  UserModel model=await UsersRemoteDataSourceImplFirebase().getUserFromDataBase('wekaid');
//  print('USER :$model');
  // var posts = await PostsRemoteDataSourceImplFirebase()
  //     .getAllPostsByCategoryId('xHIWNYHMiTjECYLaZzY8');

  // print(posts[0].toMap());
  await GoogleSignIn().signOut();
  await HiveHelper(HiveConstants.user).updateWithKey(null, HiveConstants.user);
  // var x = await HiveHelper(HiveConstants.user).getWithKey(HiveConstants.user);
  // print(x.toString());
}

Future initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserEntityAdapter());
  Hive.registerAdapter(ReviewEntityAdapter());

  await HiveHelper(HiveConstants.onboarding).openBox();
  await HiveHelper(HiveConstants.user).openBox();
}

setStatusBarColor() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: AppColors.green));
}

initBlocObserverAndRunApp() {
  timeago.setLocaleMessages('ar', timeago.ArMessages());

  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}
