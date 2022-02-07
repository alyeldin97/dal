import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects_template/blocs/categories_cubit/categroies_cubit.dart';
import 'package:projects_template/configs/constants/images.dart';
import 'package:projects_template/views/choose_category_screen/widgets/categories_grid.dart';
import 'package:projects_template/views/choose_category_screen/widgets/choose_category_text.dart';
import 'package:projects_template/views/core/error_screen.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/navigators.dart';

class ChooseCategoryScreen extends StatelessWidget {
  const ChooseCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategroiesCubit, CategroiesState>(
      listener: (context, state) {
        if (state is CategroiesGetAllCategriesErrorState) {
          navigateToErrorScreen(state.failure, context);
        }
      },
      child: BlocBuilder<CategroiesCubit, CategroiesState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.backgroundGrey,
            body: Container(
              decoration: boxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeightBox(100),
                  const ChooseCategoryText(),
                  const HeightBox(20),
                  gridOrLoading(state),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget gridOrLoading(state) {
    if (state is CategroiesGetAllCategriesSuccessState) {
      return CategoriesGrid(categories: state.categoriesEntities);
    } else if (state is CategroiesGetAllCategriesLoadingState) {
      return const Loading();
    } else {
      return Container();
    }
  }

  BoxDecoration boxDecoration() {
    return const BoxDecoration(
      image: DecorationImage(
          image: AssetImage(
            AssetImagesPaths.categoryScreenBottom,
          ),
          fit: BoxFit.fill),
    );
  }

  void navigateToErrorScreen(failure, context) {
    AppNavigator.navigateToScreen(
        ErrorScreen(message: failure.message, screen: Screens.categories),
        context);
  }
}
