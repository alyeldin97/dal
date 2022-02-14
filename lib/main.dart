import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:projects_template/configs/constants/hive.dart';
import 'package:projects_template/entities/user.dart';
import 'package:projects_template/injection_container.dart';
import 'package:projects_template/my_app.dart';
import 'package:projects_template/services/helpers/hive_helper.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/configs/bloc_observer.dart';
import 'package:bloc/bloc.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'entities/post/review.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setStatusBarColor();
  await Firebase.initializeApp();
  await initHive();
  await tester();
  initGetIt();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  initBlocObserverAndRunApp();
}










Future tester() async {
  await HiveHelper(HiveConstants.user).updateWithKey(null, HiveConstants.user);
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
