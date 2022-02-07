import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:projects_template/entities/category.dart';
import 'package:projects_template/views/choose_category_fragment/choose_category_fragment.dart';
import 'package:projects_template/views/favorites/favorites_screen.dart';
import 'package:projects_template/views/home/home_screen.dart';
import 'package:projects_template/views/profile/profile_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  List? screens;

  
  Future initiateNotch(CategoryEntity category) async {
    screens = [
      HomeScreen(
        category: category,
      ),
      FavoritesScreen(category),
      ChooseCategoryFragement(),
      ProfileScreen(),
      HomeScreen(
        category: category,
      ),
    ];
    await Future.delayed(const Duration(milliseconds: 260));
    currentIndex = 0;
    emit(LayoutIndexChangedState(index: currentIndex));
  }

  int currentIndex = 4;

  void changeCurrentIndex(index) {
    currentIndex = index;
    emit(LayoutIndexChangedState(index: currentIndex));
  }
}
