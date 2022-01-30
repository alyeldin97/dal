part of 'onboarding_cubit.dart';

abstract class OnboardingState extends Equatable {
  final bool changed;
  const OnboardingState({this.changed=false});

  @override
  List<Object> get props => [changed];
}

class OnboardingInitial extends OnboardingState {}

class OnboardingCacheLoading extends OnboardingState {}
class OnboardingCacheSuccess extends OnboardingState {}
class OnboardingCacheError extends OnboardingState {}



