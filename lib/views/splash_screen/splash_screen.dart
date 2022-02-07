import 'package:flutter/material.dart';
import 'package:projects_template/configs/constants/hive.dart';
import 'package:projects_template/configs/constants/images.dart';
import 'package:projects_template/entities/user.dart';
import 'package:projects_template/services/helpers/hive_helper.dart';
import 'package:projects_template/services/local_datasources/onboarding/onboarding_impl.dart';
import 'package:projects_template/views/utils/navigators.dart';
import 'package:projects_template/views/utils/routes.dart';

UserEntity? CURRENT_USER;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToOnboardingOrAuthOrHomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AssetImagesPaths.splashScreen))),
      ),
    );
  }

  void navigateToOnboardingOrAuthOrHomeScreen() async {
    await waitThreeSeconds();
    bool isCached = await OnboardingLocalDataSourceImpl(
            HiveHelper(HiveConstants.onboarding))
        .checkOnboardingDone();
    if (isCached) {
      bool isAlreadyLoggedIn =
          await HiveHelper(HiveConstants.user).getWithKey(HiveConstants.user) !=
              null;
      navigateToAuthScreenOrChooseCategoryScreen(isAlreadyLoggedIn);
    } else {
      navigateToOnboardingScreen();
    }
  }

  Future waitThreeSeconds() async {
    await Future.delayed(const Duration(seconds: 3));
  }

  void navigateToOnboardingScreen() {
    AppNavigator.navigateToRouteReplacement(Routes.onboardingRoute, context);
  }

  void navigateToAuthScreenOrChooseCategoryScreen(isAlreadyLoggedIn) async {
    if (isAlreadyLoggedIn) {
      CURRENT_USER =
          await HiveHelper(HiveConstants.user).getWithKey(HiveConstants.user);
      AppNavigator.navigateToRouteReplacement(Routes.chooseCategory, context);
    } else {
      AppNavigator.navigateToRouteReplacement(Routes.loginRoute, context);
    }
  }
}
