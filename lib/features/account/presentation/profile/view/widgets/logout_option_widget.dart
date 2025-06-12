import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';

class LogoutOptionWidget extends StatelessWidget {
  const LogoutOptionWidget({
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
        Icon(icon, color: context.appColors.browen, size: 30),
        SizedBox(width: 15),
        TextButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: AppStyles.textStyle18(
              context,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
