import 'package:dartz/dartz.dart';
import 'package:projects_template/services/errors/failure.dart';

abstract class OnboardingRepo {
  Future<Either<Failure, void>> cacheOnboardinAsDone();
  Future<Either<Failure, bool>> checkOnboardingDone();
}
