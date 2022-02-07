import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class ChooseCategoryText extends StatelessWidget {
  const ChooseCategoryText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.only(start:30.w),
      child: const PrimaryTextSemiBold(
        text: 'الفروع التطوعية',
        fontSize: 23,
        color: AppColors.green,
      ),
    );
  }
}
