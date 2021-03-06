import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/blocs/home_cubit/home_cubit.dart';
import 'package:projects_template/entities/category.dart';
import 'package:projects_template/views/core/error_screen.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';
import 'package:projects_template/views/home/widgets/category_name.dart';
import 'package:projects_template/views/home/widgets/post_item.dart';
import 'package:projects_template/views/home/widgets/search_bar.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/navigators.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class HomeScreen extends StatelessWidget {
  CategoryEntity category;
  HomeScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeGetAllPostsErrorState) {
          navigateToErrorScreen(state.failure, context);
        }
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Container(
            color: AppColors.backgroundGrey,
            // ignore: prefer_const_literals_to_create_immutables
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const HeightBox(50),
                  const HomeSearchBar(),
                  const HeightBox(20),
                  HomeCategoryName(categoryName: category.name),
                  const HeightBox(20),
                  hanldeStatesForPostsListView(state),
                ]),
          );
        },
      ),
    );
    ;
  }

  Widget hanldeStatesForPostsListView(state) {
    if (state is HomeGetAllPostsSuccessState) {
      return SizedBox(
        height: 530.h,
        child: SingleChildScrollView(
          child: Column(
            children: state.posts
                .map((post) => HomePostItem(
                      post: post,
                      category: category,
                    ))
                .toList(),
          ),
        ),
      );
    } else if (state is HomeGetAllPostsErrorState) {
      return Center(
        child: PrimaryTextSemiBold(
          text: state.failure.message,
          fontSize: 20,
        ),
      );
    } else {
      return const Loading();
    }
  }

  void navigateToErrorScreen(failure, context) {
    AppNavigator.navigateToScreen(
        ErrorScreen(
          message: failure.message,
          screen: Screens.home,
          arguments: category,
        ),
        context);
  }
}
