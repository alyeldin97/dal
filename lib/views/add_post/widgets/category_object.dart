import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class AddPostCategoryItem extends StatelessWidget {
  const AddPostCategoryItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
              width: 141.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12.w)),
              ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const PrimaryTextSemiBold(
            text: 'جمع التبرعات',
            fontSize: 13,
            color: AppColors.green,
          ),
          const WidthBox(10),
          Container(
            width: 32.w,
            height: 32.h,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
