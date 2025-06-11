import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_image_state.dart';

class ProfileImageCubit extends Cubit<ProfileImageState> {
  ProfileImageCubit() : super(ProfileImageInitial()) {
    loadImage();
  }

  final Box shopBox = Hive.box('shopBox');

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final newImagePath = pickedFile.path;

      final oldImagePath = shopBox.get('profileImage');
      if (oldImagePath != null && File(oldImagePath).existsSync()) {
        await File(oldImagePath).delete();
      }

      await shopBox.put('profileImage', newImagePath);

      emit(ProfileImageUpdated(imagePath: newImagePath));
    }
  }

  void loadImage() {
    final imagePath = shopBox.get('profileImage');
    if (imagePath != null && File(imagePath).existsSync()) {
      emit(ProfileImageUpdated(imagePath: imagePath));
    } else {
      emit(ProfileImageInitial());
    }
  }

  void deleteImage() async {
  final imagePath = shopBox.get('profileImage');
  if (imagePath != null && File(imagePath).existsSync()) {
    await File(imagePath).delete();
  }

  await shopBox.delete('profileImage');
  emit(ProfileImageInitial());
}

}
