import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projects_template/configs/constants/failure.dart';
import 'package:projects_template/services/errors/failure.dart';

signInWithEmailAndPasswordErrorHandler(FirebaseAuthException e) {
  const INVALID_EMAIL = 'invalid-email';
  const WRONG_PASSWORD = 'wrong-password';
  const USER_NOT_FOUND = 'user-not-found';

  if (e.code == INVALID_EMAIL || e.code == WRONG_PASSWORD) {
    return Failure(
      code: FailureCodes.invalidEmailAndPasswordCombination,
      message: FailureMessages.invalidEmailAndPasswordCombination,
    );
  } else if (e.code == USER_NOT_FOUND) {
    return Failure(
      code: FailureCodes.userNotFound,
      message: FailureMessages.userNotFound,
    );
  } else {
    return Failure(
      code: FailureCodes.defaultFailure,
      message: FailureMessages.defaultFailure,
    );
  }
}

createUserWithEmailAndPasswordErrorHandler(FirebaseAuthException e) {
  const INVALID_EMAIL = 'invalid-email';
  const WEAK_PASSWORD = 'weak-password';
  const EMAIL_ALREADY_IN_USE = 'email-already-in-use';

  if (e.code == INVALID_EMAIL) {
    return Failure(
      code: FailureCodes.invalidEmailAndPasswordCombination,
      message: FailureMessages.invalidEmailAndPasswordCombination,
    );
  } else if (e.code == WEAK_PASSWORD) {
    return Failure(
      code: FailureCodes.weakPassword,
      message: FailureMessages.weakPassword,
    );
  } else if (e.code == EMAIL_ALREADY_IN_USE) {
    return Failure(
      code: FailureCodes.emailAlreadyInUse,
      message: FailureMessages.emailAlreadyInUse,
    );
  } else {
    return Failure(
      code: FailureCodes.defaultFailure,
      message: FailureMessages.defaultFailure,
    );
  }
}

createUserWithCredntialsErrorHandler(FirebaseAuthException e) {

  const ACCOUNT_EXISTS_WITH_DIFFERENT_CREDNTIALS = 'account-exists-with-different-credential';
  

  if (e.code == ACCOUNT_EXISTS_WITH_DIFFERENT_CREDNTIALS) {
    return Failure(
      code: FailureCodes.account_exists_with_different_credentials,
      message: FailureMessages.account_exists_with_different_credentials,
    );
  
  } else {
    return Failure(
      code: FailureCodes.defaultFailure,
      message: FailureMessages.defaultFailure,
    );
  }
}



  