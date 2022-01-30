// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects_template/blocs/register_cubit/register_cubit.dart';
import 'package:projects_template/configs/global_app_dependencies.dart';
import 'package:projects_template/views/auth/widgets/image.dart';
import 'package:projects_template/views/auth/widgets/login_nav_button.dart';
import 'package:projects_template/views/auth/widgets/register_button.dart';
import 'package:projects_template/views/auth/widgets/register_form.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/navigators.dart';
import 'package:projects_template/views/utils/routes.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalAppDependencies.registerCubit,
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
           if (state is RegisterWithEmailAndPasswordFailure) {
            FlushbarHelper.createError(message: state.failure.message)
                .show(context);
          } else if (state is RegisterWithEmailAndPasswordSuccess) {
            navigateToChooseCategoryScreen(context);
          }
        },
        child: BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColors.backgroundGrey,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LoginImage(),
                    RegisterForm(),
                    const HeightBox(20),
                    registerButtonOrLoading(state),
                    const HeightBox(10),
                    const LoginNavButton(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget registerButtonOrLoading(state) {
    if (state is RegisterWithEmailAndPasswordLoading) {
      return Loading();
    } else {
      return RegisterButton();
    }
  }

  void navigateToChooseCategoryScreen(context) {
    AppNavigator.navigateToRouteReplacement(Routes.chooseCategory, context);
  }
}
