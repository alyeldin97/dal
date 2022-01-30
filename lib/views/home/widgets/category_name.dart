import 'package:flutter/material.dart';
import 'package:projects_template/views/utils/colors.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class HomeCategoryName extends StatelessWidget {
  final String categoryName;
  const HomeCategoryName({ Key? key,required this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  PrimaryTextSemiBold(
          text: categoryName,
          fontSize: 27,
          color: AppColors.green,
        );
  }
}