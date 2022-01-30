import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:projects_template/configs/constants/images.dart';
import 'package:projects_template/entities/onboarding.dart';
import 'package:projects_template/services/errors/failure.dart';
import 'package:projects_template/services/repo/onboarding/onboarding.dart';
import 'package:projects_template/views/onboarding/onboarding_screen.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit(this.onboardingRepo) : super(OnboardingInitial());
  OnboardingRepo onboardingRepo;

  List<OnBoardingEntity> onboardingEntites = [
    OnBoardingEntity(
        hadith: 'خير الاعمال الصدقة', imagePath: AssetImagesPaths.onboarding1),
    OnBoardingEntity(hadith: '''ساعد  الآخرين على عيش 
حياة كريمة''', imagePath: AssetImagesPaths.onboarding2),
    OnBoardingEntity(hadith: '''خيركم من تعلم القرآن 
وعلمه''', imagePath: AssetImagesPaths.onboarding3),
  ];

  

  void goToNextPage() {
    
  double currentPage = onboardingPageController.page!;
    bool isLastPage = currentPage == onboardingEntites.length - 1;

    if (isLastPage) {
      cacheOnboarding();
    } else {
      onboardingPageController.nextPage(
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    }
  }

  void cacheOnboarding() async {
    emit(OnboardingCacheLoading());
    Either<Failure, void> eitherSuccessOrFailure =
        await onboardingRepo.cacheOnboardinAsDone();

    eitherSuccessOrFailure.fold((failure) => emit(OnboardingCacheError()),
        (success) => emit(OnboardingCacheSuccess()));
  }
}
