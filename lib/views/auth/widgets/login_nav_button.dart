import 'package:flutter/material.dart';
import 'package:projects_template/views/utils/navigators.dart';
import 'package:projects_template/views/utils/routes.dart';
import 'package:projects_template/views/utils/textstyles.dart';

class LoginNavButton extends StatelessWidget {
  const LoginNavButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: const PrimaryTextRegular(
          text: ' لديك حساب بالفعل؟',
          fontSize: 12,
          color: Colors.grey,
        ),
        onPressed: () {
          navigateToLoginScreen(context);
        },
      ),
    );
  }

  void navigateToLoginScreen(context) {
    AppNavigator.navigateToRouteReplacement(Routes.loginRoute, context);
  }
}
