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
        Transform.scale(
          scale: .8,
          child: Switch(
            value: true,
            onChanged: (value) {},
            activeColor: AppColors().white,
            activeTrackColor: AppColors().orange,
            inactiveThumbColor: AppColors().white,
            inactiveTrackColor: AppColors().grey,
          ),
        ),
      ],
    );
  }
}
