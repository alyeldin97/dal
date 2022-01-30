import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/configs/constants/images.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class OnboardingFragment extends StatelessWidget {
  final String imagePath;
  final String hadith;
  const OnboardingFragment(
      {Key? key, required this.imagePath, required this.hadith})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration:  BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      imagePath,
                    ))),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 550.h, start: 60.w,end: 40.w),
            child: PrimaryTextSemiBold(
              text: hadith,
              isCenter: true,
              fontSize: 28.sp,
              color: AppColors.green,
            ),
          ),
        ],
      ),
    );
  }
}
