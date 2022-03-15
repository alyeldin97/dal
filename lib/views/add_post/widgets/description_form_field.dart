import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class DescriptionFormField extends StatelessWidget {
  const DescriptionFormField({
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
        SizedBox(
          width: 320.w,
          height: 102.h,
          child: TextFormField(
              maxLines: 20,
              style: primaryFontMediumTextStyle(12),
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
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
