import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects_template/blocs/profile_cubit/profile_cubit.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';
import 'package:projects_template/views/utils/validators.dart';
import 'form_field.dart';

class ProfileForm extends StatelessWidget {
  ProfileForm({Key? key}) : super(key: key);
  late ProfileCubit profileCubit;
  @override
  Widget build(BuildContext context) {
    profileCubit = BlocProvider.of<ProfileCubit>(context);
    bool isUpdating = profileCubit.isUpdating;

    return Form(
      key: profileCubit.profileFormKey,
      child: Column(
        children: [
          ProfileTextFormField(
              enabled: isUpdating,
              labelName: 'الإسم',
              controller: profileCubit.profileNameTextEditingController,
              onChanged: (value) {},
              validator: Validators.validateName),
          const HeightBox(20),
          ProfileTextFormField(
              enabled: isUpdating,
              labelName: 'العنوان',
              controller: profileCubit.profileAddressTextEditingController,
              onChanged: (value) {},
              validator: (value){}),
          const HeightBox(20),
          ProfileTextFormField(
              enabled: isUpdating,
              textInputType: TextInputType.number,
              labelName: 'الهاتف',
              controller: profileCubit.profilePhoneNumberTextEditingController,
              onChanged: (value) {},
              validator: (value){}),
        ],
      ),
    );
  }
}
