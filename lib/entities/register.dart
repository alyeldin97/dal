class RegisterUserEntity {
  String email;
  String password;
  String name;
  String phoneNumber;
  bool isMale;

  RegisterUserEntity({
    required this.email,
    required this.password,
    required this.name,
    required this.phoneNumber,
    required this.isMale,
  });
}
