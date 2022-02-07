import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/configs/constants/images.dart';

class RegisterImage extends StatelessWidget {
  const RegisterImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      width: 300.w,
      margin: EdgeInsetsDirectional.only(top: 70.h, start: 29.w),
      child: Image.asset(AssetImagesPaths.auth),
    );
  }
}
