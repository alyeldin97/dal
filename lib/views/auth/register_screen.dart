// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:projects_template/blocs/register_cubit/register_cubit.dart';
import 'package:projects_template/configs/constants/failure.dart';
import 'package:projects_template/configs/constants/get_it.dart';
import 'package:projects_template/configs/constants/hive.dart';
import 'package:projects_template/configs/global_app_dependencies.dart';
import 'package:projects_template/services/helpers/hive_helper.dart';
import 'package:projects_template/services/local_datasources/auth/auth_impl_hive.dart';
import 'package:projects_template/services/remote_datasources/auth/auth_impl_firebase.dart';
import 'package:projects_template/services/remote_datasources/images_upload/images_upload_remote_ds_impl_firebase.dart';
import 'package:projects_template/services/remote_datasources/users/users_remote_ds_impl.dart';
import 'package:projects_template/services/repo/auth/auth_impl_firebase.dart';
import 'package:projects_template/services/repo/users/users_repo_impl_firebase.dart';
import 'package:projects_template/views/auth/widgets/login_nav_button.dart';
import 'package:projects_template/views/auth/widgets/radio.dart';
import 'package:projects_template/views/auth/widgets/register_button.dart';
import 'package:projects_template/views/auth/widgets/register_form.dart';
import 'package:projects_template/views/auth/widgets/register_image.dart';
import 'package:projects_template/views/core/error_screen.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';
import 'package:projects_template/views/splash_screen/splash_screen.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/navigators.dart';
import 'package:projects_template/views/utils/routes.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<RegisterCubit>(instanceName: GetItConstants.registerCubit),
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterWithEmailAndPasswordFailure) {
            showErrorPopUpOrScreen(state, context);
          } else if (state is RegisterWithEmailAndPasswordSuccess) {
            initiateGlobalUser(state);
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
                    const RegisterImage(),
                    RegisterForm(),
                    const HeightBox(20),
                    ReisterRadio(),
                    registerButtonOrLoading(state),
                    const HeightBox(10),
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

  void initiateGlobalUser(state) {
    CURRENT_USER = state.userEntity;
  }

  void navigateToChooseCategoryScreen(context) {
    AppNavigator.navigateToRouteReplacement(Routes.chooseCategory, context);
  }

  void showErrorPopUpOrScreen(state, context) {
    bool socketError = state.failure.code == FailureCodes.socket;
    if (socketError) {
      AppNavigator.navigateToScreen(
          ErrorScreen(message: state.failure.message, screen: Screens.register),
          context);
      FocusScope.of(context).unfocus();
    } else {
      FlushbarHelper.createError(message: state.failure.message).show(context);
    }
  }
}
