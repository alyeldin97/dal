import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/blocs/home_cubit/home_cubit.dart';
import 'package:projects_template/blocs/layout_cubit/layout_cubit.dart';
import 'package:projects_template/entities/category.dart';
import 'package:projects_template/views/layout/lay_out_screen.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/navigators.dart';
import 'package:projects_template/views/utils/routes.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class CategoryItem extends StatelessWidget {
  final CategoryEntity category;
  const CategoryItem(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateToLayOutScreen(context, category);
      },
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(20.w),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20.w)),
          height: 160.h,
          width: 140.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 100.h,
                  width: 60.w,
                  child: Image.network(category.imageUrl)),
              PrimaryTextSemiBold(
                text: category.name,
                fontSize: 13.sp,
                color: AppColors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToLayOutScreen(context, category)async {
    await BlocProvider.of<LayoutCubit>(context).initiateNotch(category);
    BlocProvider.of<HomeCubit>(context).getAllPostsById(category.id);
    AppNavigator.navigateToRoute(Routes.layOut, context);
  }
}
