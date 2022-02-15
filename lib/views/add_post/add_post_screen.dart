import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/views/add_post/widgets/category_object.dart';
import 'package:projects_template/views/add_post/widgets/header_text.dart';
import 'package:projects_template/views/add_post/widgets/post_subject_form_field.dart';
import 'package:projects_template/views/choose_category_screen/widgets/category_item.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class AddPostSheet extends StatelessWidget {
  const AddPostSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 611.h,
        decoration: BoxDecoration(
          color: AppColors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.w),
            topRight: Radius.circular(30.w),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeightBox(70),
            AddPostScreenHeaderText(),
            const HeightBox(30),
            AddPostCategoryItem(),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 36.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PostSubjectFormField(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
