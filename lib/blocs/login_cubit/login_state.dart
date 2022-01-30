part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginStartValidationState extends LoginState {}

class GoogleOrFacebookLoginCancelled extends LoginState {}

class GoogleOrFacebookLoginError extends LoginState {
  Failure failure;
  GoogleOrFacebookLoginError(
    this.failure,
  );
}

class LoginRememberMeToggledState extends LoginState {
  bool rememberMe;
  LoginRememberMeToggledState(this.rememberMe);
  @override
  List<Object> get props => [rememberMe];
}

class LoginPasswordVisibilityToggledState extends LoginState {
  bool isPasswordVisibile;
  LoginPasswordVisibilityToggledState(this.isPasswordVisibile);
  @override
  List<Object> get props => [isPasswordVisibile];
}

class LoginSignInWithEmailAndPasswordSuccess extends LoginState {
  UserEntity userEntity;
  LoginSignInWithEmailAndPasswordSuccess({
    required this.userEntity,
  });
}

class LoginSignInWithEmailAndPasswordLoading extends LoginState {}

class LoginSignInWithEmailAndPasswordError extends LoginState {
  Failure failure;
  LoginSignInWithEmailAndPasswordError(
    this.failure,
  );
}

class LoginSignInWithGoogleSuccess extends LoginState {
  UserEntity userEntity;
  LoginSignInWithGoogleSuccess({
    required this.userEntity,
  });
}

class LoginSignInWithGoogleLoading extends LoginState {}

class LoginSignInWithGoogleError extends LoginState {
  Failure failure;
  LoginSignInWithGoogleError(
    this.failure,
  );
}

class LoginSignInWithFacebookSuccess extends LoginState {
  UserEntity userEntity;
  LoginSignInWithFacebookSuccess({
    required this.userEntity,
  });
}

class LoginSignInWithFacebookLoading extends LoginState {}

class LoginSignInWithFacebookError extends LoginState {
  Failure failure;
  LoginSignInWithFacebookError(
    this.failure,
  );
}
