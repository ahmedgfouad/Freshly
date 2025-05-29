import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';

class LanguageOptionWidget extends StatelessWidget {
  const LanguageOptionWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  final IconData icon;
  final String title;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: AppColors().browen, size: 30),
        SizedBox(width: 15),
        TextButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: AppStyles.textStyle18.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Spacer(),
        Text("English", style: AppStyles.textStyle14),
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.keyboard_arrow_right_outlined,
            color: AppColors().browen,
          ),
        ),
      ],
    );
  }
}
