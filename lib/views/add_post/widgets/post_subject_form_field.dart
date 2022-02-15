import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class PostSubjectFormField extends StatelessWidget {
  const PostSubjectFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeightBox(24),
        const PrimaryTextLight(
          text: 'العنوان',
          fontSize: 16,
          color: Colors.white,
        ),
        const HeightBox(18),
        Container(
          width: 320.w,
          height: 37.h,
          child: TextFormField(
              style: primaryFontMediumTextStyle(12),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.green,
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
