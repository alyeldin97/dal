import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects_template/blocs/categories_cubit/categroies_cubit.dart';
import 'package:projects_template/blocs/home_cubit/home_cubit.dart';
import 'package:projects_template/blocs/layout_cubit/layout_cubit.dart';
import 'package:projects_template/configs/constants/images.dart';
import 'package:projects_template/models/null_checkers.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';
import 'package:projects_template/views/layout/lay_out_screen.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/navigators.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class ErrorScreen extends StatelessWidget {
  final String? message;
  final Screens screen;
  final dynamic? arguments;
  const ErrorScreen(
      {Key? key, required this.message, required this.screen, this.arguments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetImagesPaths.error),
            const HeightBox(10),
            const PrimaryTextBold(
              text: '! حدث خطأ',
              fontSize: 35,
              color: AppColors.green,
            ),
            const HeightBox(75),
            PrimaryTextLight(
              text: message.ifNullOrEmptyReturn('''عذرًا لقد حدث خطأ غير متوقع
يرجى المحاولة مرة اخري'''),
              fontSize: 20,
              isCenter: true,
              color: Colors.grey,
            ),
            const HeightBox(30),
            ElevatedButton(
                onPressed: handleTryAgainButtonFunctionalityForDifferentScreens(
                    screen, context,
                    arguments: arguments),
                child: const PrimaryTextMedium(
                  text: 'إعادة المحاولة',
                  fontSize: 14,
                  color: AppColors.white,
                ))
          ],
        ),
      ),
    );
  }

  void Function()? handleTryAgainButtonFunctionalityForDifferentScreens(
      Screens screen, context,
      {arguments}) {
    switch (screen) {
      case Screens.categories:
        return () {
          BlocProvider.of<CategroiesCubit>(context).getAllCategories();
          Navigator.pop(context);
        };
      case Screens.home:
        return () async {
          await BlocProvider.of<LayoutCubit>(context).initiateNotch(arguments);
          BlocProvider.of<HomeCubit>(context).getAllPostsById(arguments.id);
          AppNavigator.navigateToScreenReplacement(
              LayOutScreen(category: arguments), context);
        };
      default:
        return () {
          Navigator.pop(context);
        };
    }
  }
}

enum Screens { home, login, register, categories }
