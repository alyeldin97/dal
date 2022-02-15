// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projects_template/blocs/profile_cubit/profile_cubit.dart';
import 'package:projects_template/configs/constants/get_it.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';
import 'package:projects_template/views/profile/widgets/buttons_row.dart';
import 'package:projects_template/views/profile/widgets/form.dart';
import 'package:projects_template/views/profile/widgets/image.dart';

import '../../injection_container.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>  sl<ProfileCubit>()..initiateProfile(),
      child: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          showError(state, context);
        },
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const HeightBox(75),
                  ProfileImage(),
                  const HeightBox(40),
                  ProfileForm(),
                  const HeightBox(120),
                  state is ProfileUpdateLoadingState
                      ? const Loading()
                      : ProfileButtonsRow(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void showError(state, context) {
    if (state is ProfileUpdateErrorState) {
      FlushbarHelper.createError(message: state.failure!.message).show(context);
    }
  }
}
