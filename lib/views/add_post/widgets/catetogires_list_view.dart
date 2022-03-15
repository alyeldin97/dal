import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/views/add_post/widgets/category_object.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      child: ListView.separated(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return AddPostCategoryItem();
        },
        separatorBuilder: (context, index) {
          return const WidthBox(22);
        },
      ),
    );
  }
}
