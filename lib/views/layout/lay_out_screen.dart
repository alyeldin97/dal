import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/blocs/layout_cubit/layout_cubit.dart';
import 'package:projects_template/configs/constants/images.dart';
import 'package:projects_template/entities/category.dart';
import 'package:projects_template/views/utils/colors.dart';

class LayOutScreen extends StatefulWidget {
  final CategoryEntity category;
  const LayOutScreen({Key? key, required this.category}) : super(key: key);

  @override
  State<LayOutScreen> createState() => _LayOutScreenState();
}

class _LayOutScreenState extends State<LayOutScreen> {
  late LayoutCubit layoutCubit;

  late int currentIndex;

  late Widget currentScreen;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        layoutCubit = BlocProvider.of<LayoutCubit>(context);
        currentIndex = layoutCubit.currentIndex;
        currentScreen = layoutCubit.screens![currentIndex];

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            extendBody: true,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: currentScreen,
            bottomNavigationBar: bottomAppBar(),
            floatingActionButton: floatingActionButton(),
          ),
        );
      },
    );
  }

  BottomAppBar bottomAppBar() {
    return BottomAppBar(
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          bottomNavBarItem(AssetImagesPaths.profileIcon, currentIndex == 3, 3),
          bottomNavBarItem(
              AssetImagesPaths.categoriesIcon, currentIndex == 2, 2),
          bottomNavBarItem(AssetImagesPaths.favIcon, currentIndex == 1, 1),
          bottomNavBarItem(AssetImagesPaths.homeIcon, currentIndex == 0, 0),
        ],
      ),
      shape: const CircularNotchedRectangle(),
      color: AppColors.green,
    );
  }

  Widget bottomNavBarItem(icon, isSelected, index) {
    return InkWell(
      onTap: () {
        layoutCubit.changeCurrentIndex(index);
      },
      child: SizedBox(
        height: 80.h,
        width: 80.w,
        child: isSelected
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(icon),
                  Container(
                    margin: EdgeInsets.only(top: 8.h),
                    color: Colors.white,
                    height: 2.h,
                    width: 17.w,
                  )
                ],
              )
            : Image.asset(icon),
      ),
    );
  }

  Visibility floatingActionButton() {
    bool keyBoardIsVisible = MediaQuery.of(context).viewInsets.bottom == 0;
    return Visibility(
      visible: keyBoardIsVisible,
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.green,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        elevation: 2.0,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
