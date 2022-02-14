import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projects_template/blocs/onboarding/onboarding_cubit.dart';
import 'package:projects_template/configs/constants/get_it.dart';
import 'package:projects_template/views/onboarding/widgets/onboarding_control.dart';
import 'package:projects_template/views/onboarding/widgets/page_indicator.dart';
import 'package:projects_template/views/onboarding/widgets/page_view.dart';
import 'package:projects_template/views/utils/navigators.dart';
import 'package:projects_template/views/utils/routes.dart';

PageController onboardingPageController = PageController();

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<OnboardingCubit>(instanceName: GetItConstants.onBoardingCubit),
      child: BlocListener<OnboardingCubit, OnboardingState>(
        listener: (context, state) {
          bool isCached = state is OnboardingCacheSuccess;
          if (isCached) {
            navigateToAuthorHomeScreen(context);
          }
        },
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            return Stack(
              children: const [
                OnboardingPageView(),
                OnboardingControl(),
                OnboardingPageIdnicator()
              ],
            );
          },
        ),
      ),
    );
  }

  void navigateToAuthorHomeScreen(context) {
    AppNavigator.navigateToRouteReplacement(Routes.loginRoute, context);
  }
}
