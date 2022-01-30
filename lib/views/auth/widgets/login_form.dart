import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects_template/views/auth/widgets/textformfield.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';
import 'package:projects_template/blocs/login_cubit/login_cubit.dart';
import 'package:projects_template/views/utils/validators.dart';

GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
TextEditingController emailControllerLogin = TextEditingController();
TextEditingController passwordControllerLogin = TextEditingController();

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = BlocProvider.of<LoginCubit>(context);
    return Form(
      key: formKeyLogin,
      autovalidateMode: loginCubit.autovalidateMode,
      child: Column(
        children: [
          AuthTextFormField(
              controller: emailControllerLogin,
              labelName: 'البريد الالكتروني',
              onChanged: (value) {},
              validator:Validators.validateEmail
              ),
          const HeightBox(23),
          AuthTextFormField(
              controller: passwordControllerLogin,
              labelName: 'كلمة السر',
              isPassword: true,
              toggleVisbility: loginCubit.passwordVisibilityToggled,
              obscureText: !loginCubit.isPasswordVisibile,
              onChanged: (value) {},
              validator: 
              Validators.validatePassword
              ),
        ],
      ),
    );
  }
}
