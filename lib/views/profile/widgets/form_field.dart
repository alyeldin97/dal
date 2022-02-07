import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class ProfileTextFormField extends StatelessWidget {
  final String labelName;
  final void Function(String) onChanged;
  final bool? isPassword;
  final String? Function(String?)? validator;
  final toggleVisbility;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final bool enabled;

  const ProfileTextFormField({
    Key? key,
    required this.labelName,
    required this.enabled,
    required this.controller,
    this.isPassword = false,
    this.toggleVisbility,
    this.textInputType,
    this.obscureText = false,
    required this.onChanged,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 33.w),
          child: PrimaryTextLight(
            text: labelName,
            fontSize: 13,
            color: AppColors.green,
          ),
        ),
        const HeightBox(10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: TextFormField(
            
              style: primaryFontMediumTextStyle(12),
              controller: controller,
              validator: validator,
              obscureText: obscureText,
              onChanged: onChanged,
              keyboardType: textInputType,
              decoration: InputDecoration(
                enabled:enabled,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ),
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
