import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/blocs/register_cubit/register_cubit.dart';
import 'package:projects_template/entities/register.dart';
import 'package:projects_template/views/auth/widgets/register_form.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class RegisterButton extends StatelessWidget {
  RegisterButton({Key? key}) : super(key: key);
  late RegisterCubit registerCubit;
  @override
  Widget build(BuildContext context) {
    registerCubit = BlocProvider.of<RegisterCubit>(context);
    return Center(
      child: SizedBox(
        height: 45.h,
        width: 280.w,
        child: ElevatedButton(
            onPressed: () {
              bool allFieldsAreValid = formKeyRegister.currentState!.validate();
              RegisterUserEntity registerUserEntity = RegisterUserEntity(
                name: nameControllerRegister.text,
                email: emailControllerRegister.text,
                password: passwordControllerRegister.text,
                phoneNumber: phoneNumberControllerRegister.text,
                isMale: isMale(registerCubit.isMale),
              );
              if (allFieldsAreValid) {
                registerCubit.signUpWithEmailAndPassword(registerUserEntity);
              } else {
                startValidating();
              }
            },
            child: const PrimaryTextSemiBold(
              text: 'انشاء حساب',
              fontSize: 13,
              color: Colors.white,
            )),
      ),
    );
  }

  void startValidating() {
    registerCubit.startValidating();
  }

  bool isMale(int isMaleFromCubitRadio) {
    if (isMaleFromCubitRadio == 0) {
      return true;
    } else {
      return false;
    }
  }
}
