import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/configs/global_app_dependencies.dart';
import 'package:projects_template/views/utils/routes.dart';
import 'package:projects_template/views/utils/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'blocs/layout_cubit/layout_cubit.dart';
import 'configs/constants/sizes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize:
            const Size(AppSizes.mobileDesignWidth, AppSizes.mobileDesignHeight),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => LayoutCubit(),
                ),
                BlocProvider(
                  create: (context) => GlobalAppDependencies.homeCubit,
                ),
              ],
              child: MaterialApp(
                theme: appThemeData(),
                debugShowCheckedModeBanner: false,
                supportedLocales: const [
                  Locale('ar', ''),
                  Locale('en', ''),
                ],
                onGenerateRoute: (routeSettings) =>
                    RouteGenerator.getRoute(routeSettings),
              ),
            ));
  }
}
