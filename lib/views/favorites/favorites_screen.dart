import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/entities/category.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class FavoritesScreen extends StatelessWidget {
  final CategoryEntity category;
  const FavoritesScreen(this.category,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
           const  HeightBox(100),
           const PrimaryTextSemiBold(
              text: 'اعمالي المفضلة',
              fontSize: 20,
              color: AppColors.green,
            ),
          const  HeightBox(20),
          const  PrimaryTextLight(
              text: '        "استعن بالله ولا تعجز"',
              fontSize: 20,
              color: AppColors.green,
            ),
            Column(
            // children: state.posts
            //     .map((post) => FavoritePostItem(
            //           post: post,
            //           category: category,
            //         ))
            //     .toList(),
          ),
          ],
        ),
      ),
    );
  }
}
