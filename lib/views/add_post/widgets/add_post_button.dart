import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class AddPostButton extends StatelessWidget {
  const AddPostButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 85.w),
      child: Container(
        height: 42.h,
        width: 129.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13.w), color: Colors.white),
        child: const Center(
          child: PrimaryTextSemiBold(
            text: 'نشر العمل',
            fontSize: 14,
            color: AppColors.green,
          ),
        ),
      ),
    );
  }
}
