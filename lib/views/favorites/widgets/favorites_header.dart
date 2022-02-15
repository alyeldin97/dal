import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class FavoritesScreenHeader extends StatelessWidget {
  const FavoritesScreenHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeightBox(100),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 25.w),
          child: const PrimaryTextSemiBold(
            text: 'اعمالي المفضلة',
            fontSize: 20,
            color: AppColors.green,
          ),
        ),
        const HeightBox(20),
        const PrimaryTextLight(
          text: '        "استعن بالله ولا تعجز"',
          fontSize: 20,
          color: AppColors.green,
        ),
      ],
    );
  }
}
