import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/blocs/profile_cubit/profile_cubit.dart';
import 'package:projects_template/configs/constants/images.dart';
import 'package:projects_template/views/utils/colors.dart';

class ProfileImage extends StatelessWidget {
  ProfileImage({Key? key}) : super(key: key);
  late ProfileCubit profileCubit;
  late bool isUpdating;

  @override
  Widget build(BuildContext context) {
    profileCubit = BlocProvider.of<ProfileCubit>(context);
    isUpdating = profileCubit.isUpdating;

    return SizedBox(
      height: 128.h,
      width: 115.w,
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 108.h,
              width: 108.w,
              child: uploadedOrCurrentImage(),
            ),
          ),
          isUpdating
              ? Container(
                  padding: EdgeInsetsDirectional.only(end: 21.w, top: 83.h),
                  child: IconButton(
                      onPressed: () {
                        profileCubit.updateImage();
                      },
                      icon: const Icon(
                        Icons.add_photo_alternate,
                        color: AppColors.green,
                      )))
              : Container(),
        ],
      ),
    );
  }

  Widget uploadedOrCurrentImage() {
    bool userPickedAndImage = profileCubit.pickedImage != null;

    if (userPickedAndImage) {
      return profileCubit.pickedImage!;
    } else {
      return profileCubit.image;
    }
  }
}
