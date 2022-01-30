class FailureCodes {
  static const int defaultFailure = -1;
  static const int invalidEmailAndPasswordCombination = -2;
  static const int userNotFound = -3;
  static const int weakPassword = -10;
  static const int emailAlreadyInUse = -11;
  static const int account_exists_with_different_credentials = -12;



}

class FailureMessages {
  static const String defaultFailure = 'حدث عطل غير متوقع نعتذر اليكم';
  static const String invalidEmailAndPasswordCombination =
      'الميل او كلمة السر غير صحيحة';
  static const String userNotFound = 'لا يوجد مستخدم بهذا الميل';
  static const String weakPassword = 'كلمة السر ضعيفة';
  static const String emailAlreadyInUse = 'هذا الميل بالفعل مشترك';
  static const String account_exists_with_different_credentials = 'هذا الميل مستخدم بالفعل بمنصة اخري';

}
