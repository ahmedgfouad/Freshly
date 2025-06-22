import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/widgets/custom_buton.dart';
import 'package:store/core/widgets/custom_textformfield_widget.dart';
import 'package:store/features/account/presentation/profile/manager/profile_image_cubit/profile_image_cubit.dart';
import 'package:store/generated/l10n.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final profileImageCubit = BlocProvider.of<ProfileImageCubit>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 30),
      child: Column(
        children: [
          BlocBuilder<ProfileImageCubit, ProfileImageState>(
            bloc: profileImageCubit,
            builder: (context, state) {
              String? imagePath;
              if (state is ProfileImageUpdated) {
                imagePath = state.imagePath;
              }

              return Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:
                        imagePath != null
                            ? Image.file(
                              File(imagePath),
                              height: MediaQuery.of(context).size.height / 3,
                            )
                            : Icon(
                              Icons.person,
                              color: context.appColors.browen,
                              size: MediaQuery.of(context).size.height / 3,
                            ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => profileImageCubit.deleteImage(),
                        child: Icon(
                          Icons.delete,
                          color: context.appColors.orange,
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () => profileImageCubit.pickImageFromGallery(),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: context.appColors.orange,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 30),
          CustomTextFormFieldWidget(hintText: "Ahmed Gamal"),
          const SizedBox(height: 30),
          CustomTextFormFieldWidget(hintText: "ahmedgamal@gmail.com"),
          Spacer(),
          CustomButon(text: S.of(context).UpdateProfile, onPressed: () {}),
        ],
      ),
    );
  }
}
