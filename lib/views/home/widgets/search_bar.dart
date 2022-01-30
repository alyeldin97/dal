import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/configs/constants/images.dart';
import 'package:projects_template/views/utils/colors.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(30.w),
        child: TextFormField(
          enabled: false,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: AppColors.green,
            ),
            suffixIcon: Image.asset(AssetImagesPaths.filterIcon),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30.w)),
            fillColor: AppColors.white,
            filled: true,
          ),
        ),
      ),
    );
  }
}
