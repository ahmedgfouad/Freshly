part of 'profile_image_cubit.dart';

abstract class ProfileImageState {}

class ProfileImageInitial extends ProfileImageState {}

class ProfileImageUpdated extends ProfileImageState {
  final String imagePath;

  ProfileImageUpdated({required this.imagePath});
}
