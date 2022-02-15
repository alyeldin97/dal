import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class AddPostScreenHeaderText extends StatelessWidget {
  const AddPostScreenHeaderText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: EdgeInsetsDirectional.only(start: 36.w),
              child: PrimaryTextLight(
                  text: ' قسم عملك التطوعي', fontSize: 21, color: Colors.white),
            );
  }
}