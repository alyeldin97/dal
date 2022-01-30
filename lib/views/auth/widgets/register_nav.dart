import 'package:flutter/material.dart';
import 'package:projects_template/views/utils/navigators.dart';
import 'package:projects_template/views/utils/routes.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class RegisterNavButton extends StatelessWidget {
  const RegisterNavButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: const PrimaryTextRegular(
          text: 'ليس لديك حساب؟',
          fontSize: 12,
          color: Colors.grey,
        ),
        onPressed: () {
          navigateToRegisterScreen(context);
        },
      ),
    );
  }

  void navigateToRegisterScreen(context) {
    AppNavigator.navigateToRouteReplacement(Routes.registerRoute, context);
  }
}
