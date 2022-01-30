import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects_template/configs/constants/images.dart';
import 'package:projects_template/views/core/reusable_widgets.dart';
import 'package:projects_template/views/utils/textstyles.dart';
import 'package:projects_template/blocs/login_cubit/login_cubit.dart';

class SocialLoginButtons extends StatelessWidget {
  SocialLoginButtons({Key? key}) : super(key: key);
  late LoginCubit loginCubit;

  @override
  Widget build(BuildContext context) {
    loginCubit = BlocProvider.of<LoginCubit>(context);
    return Row(
      children: [
        const WidthBox(80),
        const PrimaryTextSemiBold(
          text: 'او سجل ب',
          fontSize: 14,
          color: Colors.grey,
        ),
        const WidthBox(10),
        InkWell(
            onTap: () {
              signInWithGoogle();
            },
            child: Image.asset(AssetImagesPaths.googleIcon)),
        InkWell(
            onTap: () {
              signInWithFacebook();
            },
            child: Image.asset(AssetImagesPaths.faceBookIcon)),
      ],
    );
  }

  void signInWithGoogle() {
    loginCubit.signInWithGoogle();
  }

  void signInWithFacebook() {
    loginCubit.signInWithFacebook();
  }
}
