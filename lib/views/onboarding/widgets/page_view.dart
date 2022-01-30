import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects_template/blocs/onboarding/onboarding_cubit.dart';
import 'package:projects_template/entities/onboarding.dart';
import 'package:projects_template/views/onboarding/widgets/onboarding_fragement.dart';

import '../onboarding_screen.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnboardingCubit onboardingCubit = BlocProvider.of<OnboardingCubit>(context);
    List<OnBoardingEntity> onboardingEntites =
        onboardingCubit.onboardingEntites;
    return PageView(
      controller: onboardingPageController,
      onPageChanged: (currentPage) async {
        cacheIfLastPage(currentPage, context);
      },
      clipBehavior: Clip.antiAliasWithSaveLayer,
      children: onboardingEntites.map((onboardingEntity) {
        return OnboardingFragment(
            imagePath: onboardingEntity.imagePath,
            hadith: onboardingEntity.hadith);
      }).toList(),
    );
  }

  void cacheIfLastPage(currentPage, context) async {
    bool isLastPage = currentPage == 2;
    if (isLastPage) {
      await Future.delayed(const Duration(seconds: 2));
      BlocProvider.of<OnboardingCubit>(context).cacheOnboarding();
    }
  }
}
