import 'package:equatable/equatable.dart';
import 'package:projects_template/configs/constants/failure.dart';

class Failure {
  int code;
  String message;
  Failure({
    required this.code,
    required this.message,
  });
}


defaultFailure(){
  return Failure(
        code: FailureCodes.defaultFailure,
        message: FailureMessages.defaultFailure,
      );
}

socketFailure(){
  return Failure(
        code: FailureCodes.socket,
        message: FailureMessages.socket,
      );
}