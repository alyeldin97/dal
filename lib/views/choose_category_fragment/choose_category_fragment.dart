import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects_template/blocs/categories_cubit/categroies_cubit.dart';
import 'package:projects_template/configs/constants/images.dart';
import 'package:projects_template/views/choose_category_screen/widgets/categories_grid.dart';
import 'package:projects_template/views/choose_category_screen/widgets/choose_category_text.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class ChooseCategoryFragement extends StatelessWidget {
  const ChooseCategoryFragement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategroiesCubit, CategroiesState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
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
    );
  }

  Widget gridOrLoading(state) {
    if (state is CategroiesGetAllCategriesSuccessState) {
      return CategoriesGrid(categories: state.categoriesEntities);
    } else if (state is CategroiesGetAllCategriesLoadingState) {
      return const Loading();
    } else {
      return const Center(
        child: PrimaryTextMedium(text: 'عطل', fontSize: 13),
      );
    }
  }

  BoxDecoration boxDecoration() {
    return const BoxDecoration(
      color: AppColors.backgroundGrey,
    );
  }
}
