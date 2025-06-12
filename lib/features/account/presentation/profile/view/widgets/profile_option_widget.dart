import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';

class ProfileOptionWidget extends StatelessWidget {
  const ProfileOptionWidget({
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
    return InkWell(
      onTap: onPressed,
      splashColor: context.appColors.orange,
      child: Card(
        elevation: 0,
        color: context.appColors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: context.appColors.browen, size: 30),
            const SizedBox(width: 15),
            Text(
              title,
              style: AppStyles.textStyle18(
                context,
              ).copyWith(fontWeight: FontWeight.bold),
            ),

            Spacer(),
            Icon(
              Icons.keyboard_arrow_right_outlined,
              color: context.appColors.browen,
            ),
          ],
        ),
      ),
    );
  }
}
