import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/entities/login.dart';
import 'package:projects_template/views/auth/widgets/login_form.dart';
import 'package:projects_template/views/utils/textstyles.dart';
import 'package:projects_template/blocs/login_cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  LoginButton({Key? key}) : super(key: key);
  late LoginCubit loginCubit;
  @override
  Widget build(BuildContext context) {
    loginCubit = BlocProvider.of<LoginCubit>(context);
    return Center(
      child: SizedBox(
        height: 45.h,
        width: 280.w,
        child: ElevatedButton(
            onPressed: () {
              bool emailAndPasswordAreValid =
                  formKeyLogin.currentState!.validate();
              if (emailAndPasswordAreValid) {
                signInWithEmailAndPassword();
              } else {
                startValidating();
              }
            },
            child: const PrimaryTextSemiBold(
              text: 'تسجيل الدخول',
              fontSize: 13,
              color: Colors.white,
            )),
      ),
    );
  }

  void signInWithEmailAndPassword() {
    loginCubit.signInWithEmailAndPassword(LoginUserEntity(
      email: emailControllerLogin.text,
      password: passwordControllerLogin.text,
    ));
  }

  void startValidating() {
    loginCubit.startValidating();
  }
}
