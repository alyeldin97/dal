import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projects_template/configs/constants/hive.dart';
import 'package:projects_template/entities/user.dart';
import 'package:projects_template/services/errors/failure.dart';
import 'package:projects_template/services/helpers/hive_helper.dart';
import 'package:projects_template/services/repo/users/users_repo.dart';
import 'package:projects_template/views/splash_screen/splash_screen.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  UsersRepo usersRepo;
  ProfileCubit(this.usersRepo) : super(ProfileInitial());
  bool isUpdating = false;
  UserEntity user = CURRENT_USER!;
  Widget? pickedImage;
  File? pickedImageFile;
  late Widget image;

  GlobalKey<FormState> profileFormKey = GlobalKey();
  TextEditingController profileNameTextEditingController =
      TextEditingController();
  TextEditingController profileAddressTextEditingController =
      TextEditingController();

  TextEditingController profilePhoneNumberTextEditingController =
      TextEditingController();

  void initiateProfile() async {
    _initiateControllerAndImageValues();
    emit(ProfileInitiatedState());
  }

  void toggleIsUpdating() {
    isUpdating = !isUpdating;
    _nullifyPickedImage();
    emit(ProfileIsUpdatingToggled(isUpdating));
  }

  void updateImage() async {
    emit(ProfilePickedImageLoadingState());
    XFile? pickedImageFromUI =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    bool userPickedAnImage = pickedImageFromUI != null;
    if (userPickedAnImage) {
      pickedImageFile = File(pickedImageFromUI.path);
      pickedImage = CircleAvatar(backgroundImage: FileImage(pickedImageFile!));
    }
    emit(ProfilePickedImageSuccessState(pickedImage));
  }

  void updateUserInDataBase() async {
    emit(ProfileUpdateLoadingState());
    UserEntity updatedUser = _updateCurrentUserWithNewValues();
    print('ana hena 0');

    Either<Failure, void> eitherFailureOrUploadSuccess = await usersRepo
        .updateUserInDatabase(updatedUser, pickedImage: pickedImageFile);
    print('ana hena 1');
    eitherFailureOrUploadSuccess.fold((failure) {
      print('ana hena error');

      emit(ProfileUpdateErrorState(failure));
    }, (r) async {
      print('ana hena success');

      user = CURRENT_USER!;
      _stopUpdatingAndNullifyPickedImage();
      image = CircleAvatar(backgroundImage: NetworkImage(user.imageUrl));
      await cacheUpdatedUser(user);
      emit(ProfileUpdateSuccessState());
    });
  }

  //^ Private Functions:

  void _initiateControllerAndImageValues() {
    profileNameTextEditingController.text = user.name;
    profileAddressTextEditingController.text = user.address;
    profilePhoneNumberTextEditingController.text = user.phoneNumber;
    image = CircleAvatar(backgroundImage: NetworkImage(user.imageUrl));
  }

  void _nullifyPickedImage() {
    pickedImage = null;
    pickedImageFile = null;
  }

  UserEntity _updateCurrentUserWithNewValues() {
    return CURRENT_USER!.copyWith(
      name: profileNameTextEditingController.text,
      address: profileAddressTextEditingController.text,
      phoneNumber: profilePhoneNumberTextEditingController.text,
    );
  }

  void _stopUpdatingAndNullifyPickedImage() {
    pickedImageFile = null;
    pickedImage = null;
    isUpdating = false;
  }

  Future<void> cacheUpdatedUser(user) async {
    await HiveHelper(HiveConstants.user)
        .updateWithKey(user, HiveConstants.user);
  }

  //^dispose function
  @override
  Future<void> close() async {
    profileNameTextEditingController.dispose();
    profileAddressTextEditingController.dispose();
    profilePhoneNumberTextEditingController.dispose();

    super.close();
  }
}
