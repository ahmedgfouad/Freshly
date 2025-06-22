import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/thems/colors.dart';
import 'package:store/core/thems/styles.dart';
import 'package:store/features/account/presentation/profile/manager/profile_image_cubit/profile_image_cubit.dart';

AppBar customAppBar({
  required String title,
  required BuildContext context,
  bool arrowBack = true,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    actions: [
      BlocBuilder<ProfileImageCubit, ProfileImageState>(
        builder: (context, state) {
          if (state is ProfileImageUpdated) {
            return CircleAvatar(
              radius: 20,
              backgroundImage: FileImage(File(state.imagePath)),
            );
          } else {
            return CircleAvatar(
              radius: 20,
              backgroundColor: context.appColors.offWhite,
              child: Icon(
                Icons.person,
                color: context.appColors.orange,
                size: 30,
              ),
            );
          }
        },
      ),
      const SizedBox(width: 10),
    ],
    leading:
        arrowBack
            ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios, color: context.appColors.orange),
            )
            : null,
    title: Text(
      title,
      style: AppStyles.textStyle24(
        context,
      ).copyWith(color: context.appColors.orange),
    ),
    centerTitle: true,
  );
}
