import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class HomeIconAndNumber extends StatelessWidget {
   IconData icon;
   int number;
   HomeIconAndNumber(this.icon,this.number,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      PrimaryTextSemiBold(
        text: '$number',
        fontSize: 10,
        color: AppColors.green,
      ),
      WidthBox(5),
      Icon(
        icon,
        color: AppColors.green,
        size: 20.h,
      ),
    ]);
  }
}
