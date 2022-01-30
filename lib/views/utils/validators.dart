class Validators {
  static const _invalidPassword = 'كلمة السر يجب ان تكون اكثر من ٦ حروف';
  static const _invalidEmail = 'من فضلك ادخل بريد الكتروني صحيح';
  static const _invalidName = 'ادخل اسمك';
  static const _invalidPhoneNumber = 'ادخل رقم صحيح';


  


  static String? validateEmail(String? email) {
    bool emailIsNotvalid = email!=null && !RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailIsNotvalid) {
      return _invalidEmail;
    }
  }

  static String? validatePassword(String? password) {
    if (password!=null&&  password.length <= 6) {
      return _invalidPassword;
    }
  }

   static String? validateNumber(String? phoneNumber) {
    if (phoneNumber!=null&&  phoneNumber.length != 11) {
      return _invalidPhoneNumber;
    }
  }

  static String? validateName(String? name) {
    if (name!=null&&name.isEmpty) {
      return _invalidName;
    }
  }
}
