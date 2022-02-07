import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/blocs/register_cubit/register_cubit.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class ReisterRadio extends StatelessWidget {
  ReisterRadio({Key? key}) : super(key: key);
  late RegisterCubit registerCubit;
  @override
  Widget build(BuildContext context) {
    registerCubit = BlocProvider.of<RegisterCubit>(context);
    return Container(
      padding: EdgeInsetsDirectional.only(start: 40.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PrimaryTextLight(
            text: 'النوع',
            fontSize: 13,
            color: AppColors.green,
          ),
          Row(
            children: [
              Radio(
                  fillColor: MaterialStateProperty.all(AppColors.green),
                  value: 0,
                  groupValue: registerCubit.isMale,
                  onChanged: (newValue) {
                    registerCubit.setIsMale(0);
                  }),
              const PrimaryTextSemiBold(
                text: 'ذكر',
                fontSize: 14,
                color: Colors.grey,
              ),
              Radio(
                  fillColor: MaterialStateProperty.all(AppColors.green),
                  value: 1,
                  groupValue: registerCubit.isMale,
                  onChanged: (newValue) {
                    registerCubit.setIsMale(1);
                  }),
              const PrimaryTextSemiBold(
                text: 'انثي',
                fontSize: 14,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
