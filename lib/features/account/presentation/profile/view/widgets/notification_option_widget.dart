import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/generated/l10n.dart';

class NotificationOptionWidget extends StatelessWidget {
  const NotificationOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.notifications, color: AppColors().browen, size: 30),
        SizedBox(width: 15),
        Text(
          S.of(context).Notifications,
          style: AppStyles.textStyle18.copyWith(fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Icon(Icons.notifications, size: 20, color: AppColors().orange),
        Transform.scale(
          scale: .8,
          child: Switch(
            value: false,
            onChanged: (value) {},
            activeColor: AppColors().white,
            activeTrackColor: AppColors().browen,
            inactiveThumbColor: AppColors().white,
            inactiveTrackColor: AppColors().orange,
          ),
        ),
        Icon(Icons.notifications_off, size: 20, color: AppColors().browen),
      ],
    );
  }
}
