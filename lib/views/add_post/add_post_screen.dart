import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class AddPostSheet extends StatelessWidget {
  const AddPostSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 611.h,
      decoration: BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.w),
          topRight: Radius.circular(30.w),
        ),
      ),
      child: Column(
        children: [
          PrimaryTextLight(text: ' قسم عملك التطوعي', fontSize: 21)
        ],
      ),
    );
  }
}
