part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}
class RegisterStartValidationState extends RegisterState {}


class RegisterPasswordVisibilityToggledState extends RegisterState {
  bool isPasswordVisibile;
  RegisterPasswordVisibilityToggledState(this.isPasswordVisibile);
  @override
  List<Object> get props => [isPasswordVisibile];
}

class RegisterWithEmailAndPasswordLoading extends RegisterState {}
class RegisterWithEmailAndPasswordSuccess extends RegisterState {
  UserEntity userEntity;
  RegisterWithEmailAndPasswordSuccess({
    required this.userEntity,
  });

}
class RegisterWithEmailAndPasswordFailure extends RegisterState {
  Failure failure;
  RegisterWithEmailAndPasswordFailure({
    required this.failure,
  });
}




