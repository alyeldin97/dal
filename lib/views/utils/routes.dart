import 'package:flutter/material.dart';
import 'package:projects_template/entities/category.dart';
import 'package:projects_template/views/auth/login_screen.dart';
import 'package:projects_template/views/auth/register_screen.dart';
import 'package:projects_template/views/choose_category_screen/choose_category_screen.dart';
import 'package:projects_template/views/home/home_screen.dart';
import 'package:projects_template/views/layout/lay_out_screen.dart';
import 'package:projects_template/views/onboarding/onboarding_screen.dart';
import 'package:projects_template/views/splash_screen/splash_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onboardingRoute = "/onboarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String layOut = "/layout";
  static const String home = "/home";
  static const String chooseCategory = "/choose_category";
  static const String error = "/error";
}

class RouteGenerator {
  // static  HomeCubit _homeCubit =
  //     HomeCubit(PostsRepoImplFirebase(PostsRemoteDataSourceImplFirebase()));
  // static  LayoutCubit _layoutCubit = LayoutCubit();

  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.onboardingRoute:
        return MaterialPageRoute(
            builder: (_) => const Directionality(
                textDirection: TextDirection.rtl, child: OnBoardingScreen()));
      case Routes.loginRoute:
        return MaterialPageRoute(
            builder: (_) => Directionality(
                textDirection: TextDirection.rtl, child: LoginScreen()));
      case Routes.registerRoute:
        return MaterialPageRoute(
            builder: (_) => const Directionality(
                textDirection: TextDirection.rtl, child: RegisterScreen()));
      case Routes.home:
        return MaterialPageRoute(
            builder: (_) => Directionality(
                textDirection: TextDirection.rtl,
                child: HomeScreen(
                  category: CategoryEntity(
                      id: 'xHIWNYHMiTjECYLaZzY8',
                      name: 'جمع التبرعات',
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/dall-1d523.appspot.com/o/salary.png?alt=media&token=ef5164fb-b7d4-4bef-abcc-1d1e96978c3a'),
                )));
      case Routes.chooseCategory:
        return MaterialPageRoute(
            builder: (_) => const Directionality(
                textDirection: TextDirection.rtl,
                child: ChooseCategoryScreen()));
      case Routes.layOut:
        return MaterialPageRoute(
            builder: (_) => Directionality(
                  textDirection: TextDirection.rtl,
                  child: LayOutScreen(
                    category: CategoryEntity(
                        id: 'xHIWNYHMiTjECYLaZzY8',
                        name: 'جمع التبرعات',
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/dall-1d523.appspot.com/o/salary.png?alt=media&token=ef5164fb-b7d4-4bef-abcc-1d1e96978c3a'),
                  ),
                ));

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('No Route Found'),
              ),
              body: const Center(child: Text('No Route Found')),
            ));
  }
}
