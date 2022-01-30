import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/blocs/onboarding/onboarding_cubit.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class OnboardingControl extends StatelessWidget {
  const OnboardingControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnboardingCubit onboardingCubit = BlocProvider.of<OnboardingCubit>(context);

    return Padding(
      padding: EdgeInsetsDirectional.only(top: 750.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () {
                onboardingCubit.goToNextPage();
              },
              child: const PrimaryTextLight(
                text: 'التالي',
                fontSize: 17,
                color: AppColors.green,
              )),
          TextButton(
              onPressed: () {
                onboardingCubit.cacheOnboarding();

              },
              child: const PrimaryTextLight(
                text: 'تخطي',
                fontSize: 17,
                color: AppColors.green,
              )),
        ],
      ),
    );
  }
}
