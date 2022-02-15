import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:projects_template/configs/constants/get_it.dart';
import 'package:projects_template/views/utils/routes.dart';
import 'package:projects_template/views/utils/theme.dart';
import 'blocs/categories_cubit/categroies_cubit.dart';
import 'blocs/home_cubit/home_cubit.dart';
import 'blocs/layout_cubit/layout_cubit.dart';
import 'configs/constants/sizes.dart';
import 'injection_container.dart';

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
                  create: (context) => sl<LayoutCubit>(),
                  
                ),
                BlocProvider(
                  create: (context) => sl<HomeCubit>(),
                ),
                BlocProvider(
                  create: (context) => sl<CategroiesCubit>()
                    ..getAllCategories(),
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
