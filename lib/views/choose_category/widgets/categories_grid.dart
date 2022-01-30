import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/entities/category.dart';
import 'package:projects_template/views/choose_category/widgets/category_item.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class CategoriesGrid extends StatelessWidget {
  final List<CategoryEntity> categories;
  const CategoriesGrid({required this.categories,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 560.h,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 36.w),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          crossAxisSpacing: 25.w,
          mainAxisSpacing: 25.h,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          CategoryEntity currentCategory =categories[index];
          return CategoryItem(currentCategory);
        },
      ),
    );
  }
}
