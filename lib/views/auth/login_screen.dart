// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects_template/blocs/login_cubit/login_cubit.dart';
import 'package:projects_template/configs/constants/failure.dart';
import 'package:projects_template/configs/constants/hive.dart';
import 'package:projects_template/configs/global_app_dependencies.dart';
import 'package:projects_template/services/helpers/hive_helper.dart';
import 'package:projects_template/services/local_datasources/auth/auth_impl_hive.dart';
import 'package:projects_template/services/remote_datasources/auth/auth_impl_firebase.dart';
import 'package:projects_template/services/remote_datasources/users/users_remote_ds_impl.dart';
import 'package:projects_template/services/repo/auth/auth_impl_firebase.dart';
import 'package:projects_template/views/auth/widgets/check_box.dart';
import 'package:projects_template/views/auth/widgets/image.dart';
import 'package:projects_template/views/auth/widgets/login_button.dart';
import 'package:projects_template/views/auth/widgets/login_form.dart';
import 'package:projects_template/views/auth/widgets/register_nav.dart';
import 'package:projects_template/views/auth/widgets/social_buttons.dart';
import 'package:projects_template/views/core/error_screen.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';
import 'package:projects_template/views/splash_screen/splash_screen.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/navigators.dart';
import 'package:projects_template/views/utils/routes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(AuthRepoFirebaseImpl(
          AuthRemoteDataSourceFirebaseImpl(),
          AuthLocalDataSourceImplHive(HiveHelper(HiveConstants.user)),
          UsersRemoteDataSourceImplFirebase())),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          bool stateIsFailure = state is LoginSignInWithEmailAndPasswordError ||
              state is LoginSignInWithGoogleError ||
              state is LoginSignInWithFacebookError ||
              state is GoogleOrFacebookLoginError;
          bool stateIsSuccess =
              state is LoginSignInWithEmailAndPasswordSuccess ||
                  state is LoginSignInWithFacebookSuccess ||
                  state is LoginSignInWithGoogleSuccess;

          if (stateIsFailure) {
            showErrorPopUpOrScreen(state, context);
          } else if (stateIsSuccess) {
            initiateGlobalUser(state);
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

  void initiateGlobalUser(state) {
    if (state is LoginSignInWithEmailAndPasswordSuccess) {
      CURRENT_USER = state.userEntity;
    } else if (state is LoginSignInWithFacebookSuccess) {
      CURRENT_USER = state.userEntity;
    } else if (state is LoginSignInWithGoogleSuccess) {
      CURRENT_USER = state.userEntity;
    }
  }

  void navigateToChooseCategoryScreen(context) {
    AppNavigator.navigateToRouteReplacement(Routes.chooseCategory, context);
  }

  void showErrorPopUpOrScreen(state, context) {
    bool socketError = state.failure.code == FailureCodes.socket;
    if (socketError) {
      AppNavigator.navigateToScreen(
          ErrorScreen(message: state.failure.message, screen: Screens.login),
          context);
      FocusScope.of(context).unfocus();
    } else {
      FlushbarHelper.createError(message: state.failure.message).show(context);
    }
  }
}
