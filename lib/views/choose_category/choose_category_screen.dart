// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects_template/blocs/categories_cubit/categroies_cubit.dart';
import 'package:projects_template/configs/constants/images.dart';
import 'package:projects_template/services/remote_datasources/categories/categories_remote_ds_impl_firebase.dart';
import 'package:projects_template/services/repo/categories/categories_repo_impl_firebase.dart';
import 'package:projects_template/views/choose_category/widgets/categories_grid.dart';
import 'package:projects_template/views/choose_category/widgets/choose_category_text.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class ChooseCategoryScreen extends StatelessWidget {
  const ChooseCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategroiesCubit(
          CategoriesRepoImplFirebase(CategoriesRemoteDataSourceImplFirebase()))..getAllCategories(),
      child: BlocBuilder<CategroiesCubit, CategroiesState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.backgroundGrey,
            body: Container(
              decoration: boxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
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
      return Loading();
    } else {
      return Center(
        child: PrimaryTextMedium(text: 'عطل', fontSize: 13),
      );
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
}
