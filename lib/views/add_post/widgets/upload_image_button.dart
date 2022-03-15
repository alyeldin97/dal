import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class UploadImageButton extends StatelessWidget {
  const UploadImageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          const PrimaryTextLight(
            text: 'اضف صورة',
            fontSize: 16,
            color: Colors.white,
          ),
          const WidthBox(12),
          SizedBox(
            height: 26.h,
            width: 26.w,
            child: Image.asset('assets/icons/2.0x/categories.png'),
          )
        ],
      ),
    );
  }
}
