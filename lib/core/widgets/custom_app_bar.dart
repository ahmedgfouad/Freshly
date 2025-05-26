import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';

AppBar customAppBar({
  required String title,
  required BuildContext context,
  bool arrowBack = true,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading:
        arrowBack
            ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios, color: AppColors().orange),
            )
            : null,
    title: Text(
      title,
      style: AppStyles.textStyle24.copyWith(color: AppColors().orange),
    ),
    centerTitle: true,
    backgroundColor: AppColors().white,
  );
}
