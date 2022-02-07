part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileInitiatedState extends ProfileState {}

class ProfilePickedImageLoadingState extends ProfileState {}

class ProfilePickedImageSuccessState extends ProfileState {
  Widget? uploadedImage;
  ProfilePickedImageSuccessState(
    this.uploadedImage,
  );
}

class ProfileIsUpdatingToggled extends ProfileState {
  bool isUpdating;
  ProfileIsUpdatingToggled(this.isUpdating);

  @override
  List<Object> get props => [isUpdating];
}

class ProfileUpdateLoadingState extends ProfileState {}

class ProfileUpdateSuccessState extends ProfileState {}

class ProfileUpdateErrorState extends ProfileState {
  Failure? failure;
  ProfileUpdateErrorState(
    this.failure,
  );
}
