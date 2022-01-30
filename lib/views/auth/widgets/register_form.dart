import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects_template/blocs/register_cubit/register_cubit.dart';
import 'package:projects_template/views/auth/widgets/textformfield.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';
import 'package:projects_template/views/utils/validators.dart';

GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();
TextEditingController nameControllerRegister = TextEditingController();
TextEditingController emailControllerRegister = TextEditingController();
TextEditingController passwordControllerRegister = TextEditingController();
TextEditingController phoneNumberControllerRegister = TextEditingController();


class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = BlocProvider.of<RegisterCubit>(context);
    return Form(
      key: formKeyRegister,
      autovalidateMode: registerCubit.autovalidateMode,
      child: Column(
        children: [
          AuthTextFormField(
              controller: nameControllerRegister,
              labelName: 'الاسم',
              onChanged: (value) {},
              validator: Validators.validateName),
          const HeightBox(23),
          AuthTextFormField(
              controller: phoneNumberControllerRegister,
              labelName: 'رقم الهاتف',
              textInputType:TextInputType.phone,
              onChanged: (value) {},
              validator: Validators.validateNumber),
          const HeightBox(23),
          AuthTextFormField(
              controller: emailControllerRegister,
              labelName: 'البريد الالكتروني',
              onChanged: (value) {},
              validator: Validators.validateEmail),
          const HeightBox(23),
          AuthTextFormField(
            controller: passwordControllerRegister,
            isPassword: true,
            obscureText: !registerCubit.isPasswordVisibile,
            labelName: 'كلمة السر',
            toggleVisbility: registerCubit.passwordVisibilityToggled,
            onChanged: (value) {},
            validator: (Validators.validatePassword),
          ),
        ],
      ),
    );
  }
}
