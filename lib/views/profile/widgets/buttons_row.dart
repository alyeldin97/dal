import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/blocs/profile_cubit/profile_cubit.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class ProfileButtonsRow extends StatelessWidget {
  ProfileButtonsRow({Key? key}) : super(key: key);
  late ProfileCubit profileCubit;
  @override
  Widget build(BuildContext context) {
    profileCubit = BlocProvider.of<ProfileCubit>(context);
    bool isUpdating = profileCubit.isUpdating;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 120.w,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.white)),
              onPressed: () {
                profileCubit.toggleIsUpdating();
              },
              child:  PrimaryTextSemiBold(
                text: isUpdating? 'اغلاق التعديل' :'تعديل',
                fontSize: 13,
                color: AppColors.green,
              )),
        ),
        const WidthBox(37),
        SizedBox(
          width: 120.w,
          child: ElevatedButton(
              style: isUpdating
                  ? null
                  : ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey)),
              onPressed: isUpdating ? () {
                profileCubit.updateUserInDataBase();
              } : null,
              child: const PrimaryTextSemiBold(
                text: 'حفظ',
                fontSize: 13,
                color: AppColors.white,
              )),
        ),
      ],
    );
  }
}
