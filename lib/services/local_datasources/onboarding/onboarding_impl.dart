import 'package:projects_template/configs/constants/failure.dart';
import 'package:projects_template/services/errors/exceptions.dart';
import 'package:projects_template/services/errors/failure.dart';
import 'package:projects_template/services/helpers/hive_helper.dart';
import 'package:projects_template/services/local_datasources/onboarding/onboarding.dart';

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  HiveHelper hiveHelper;
  OnboardingLocalDataSourceImpl(this.hiveHelper);
  @override
  Future cacheOnboardinAsDone() async {
    try {
      hiveHelper.addWithKey(true, 'onboarding');
    } catch (e) {
      throw Failure(
        code: FailureCodes.defaultFailure,
        message: FailureMessages.defaultFailure
      );
    }
  }

  @override
  Future<bool> checkOnboardingDone() async {
    try {
      bool isCached = await hiveHelper.getWithKey('onboarding') ?? false;
      return isCached;
    } catch (e) {
       throw Failure(
        code: FailureCodes.defaultFailure,
        message: FailureMessages.defaultFailure
      );
    }
  }
}
