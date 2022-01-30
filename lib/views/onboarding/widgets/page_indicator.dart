import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/views/onboarding/onboarding_screen.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPageIdnicator extends StatelessWidget {
  const OnboardingPageIdnicator({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h;
    return  Padding(
          padding: EdgeInsetsDirectional.only(top: 720.h, start: 150.w),
          child: SmoothPageIndicator(
              controller: onboardingPageController, // PageController
              count: 3,
              effect: WormEffect(
                  dotColor: AppColors.green.withOpacity(0.5),
                  activeDotColor: AppColors.green), // your preferred effect
              onDotClicked: (index) {}),
        );
  }
}