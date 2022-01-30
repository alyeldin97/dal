import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/blocs/login_cubit/login_cubit.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class LoginCheckBox extends StatelessWidget {
  const LoginCheckBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   LoginCubit loginCubit= BlocProvider.of<LoginCubit>(context);
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 225.w, start: 30.w),
      child: CheckboxListTile(
        activeColor: AppColors.green,
        value: loginCubit.rememberMeChecked,
        onChanged: (value) {
          
          loginCubit.rememberMeToggled();
        },
        title: const PrimaryTextBold(
          text: 'تذكرني',
          fontSize: 12,
          color: AppColors.green,
        ),
      ),
    );
  }
}
