import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';

class AccountOptionWidget extends StatelessWidget {
  const AccountOptionWidget({
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
        color: context.appColors.white,
        elevation: 0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: context.appColors.orange, size: 30),
            SizedBox(width: 10.w),
            Text(
              title,
              style: AppStyles.textStyle22(
                context,
              ).copyWith(color: context.appColors.browen),
            ),
          ],
        ),
      ),
    );
  }
}
