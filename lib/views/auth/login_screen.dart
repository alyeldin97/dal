// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects_template/blocs/login_cubit/login_cubit.dart';
import 'package:projects_template/configs/global_app_dependencies.dart';
import 'package:projects_template/views/auth/widgets/check_box.dart';
import 'package:projects_template/views/auth/widgets/image.dart';
import 'package:projects_template/views/auth/widgets/login_button.dart';
import 'package:projects_template/views/auth/widgets/login_form.dart';
import 'package:projects_template/views/auth/widgets/register_nav.dart';
import 'package:projects_template/views/auth/widgets/social_buttons.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/navigators.dart';
import 'package:projects_template/views/utils/routes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalAppDependencies.loginCubit,
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          
          if (state is LoginSignInWithEmailAndPasswordError) {
            createErrorPopUp(state.failure, context);
          } else if (state is LoginSignInWithGoogleError) {
            createErrorPopUp(state.failure, context);
          } else if (state is GoogleOrFacebookLoginError) {
            createErrorPopUp(state.failure, context);
          } else if (state is LoginSignInWithFacebookError) {
            createErrorPopUp(state.failure, context);
          } else if (state is LoginSignInWithEmailAndPasswordSuccess ||
              state is LoginSignInWithGoogleSuccess ||
              state is LoginSignInWithFacebookSuccess) {
            navigateToChooseCategoryScreen(context);
          }
        },
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColors.backgroundGrey,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LoginImage(),
                    LoginForm(),
                    LoginCheckBox(),
                    loginButtonOrLoading(state),
                    const HeightBox(10),
                    SocialLoginButtons(),
                    const RegisterNavButton(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget loginButtonOrLoading(state) {
    if (state is LoginSignInWithEmailAndPasswordLoading ||
        state is LoginSignInWithGoogleLoading ||
        state is LoginSignInWithFacebookLoading) {
      return Loading();
    } else {
      return LoginButton();
    }
  }

  void navigateToChooseCategoryScreen(context) {
    AppNavigator.navigateToRouteReplacement(Routes.chooseCategory, context);
  }

  void createErrorPopUp(failure, context) {
    FlushbarHelper.createError(message: failure.message).show(context);
  }
}
