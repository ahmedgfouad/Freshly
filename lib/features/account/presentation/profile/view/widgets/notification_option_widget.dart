import 'package:flutter/material.dart';
import 'package:store/core/theme/colors.dart';
import 'package:store/core/theme/styles.dart';
import 'package:store/generated/l10n.dart';

class NotificationOptionWidget extends StatelessWidget {
  const NotificationOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.notifications, color: context.appColors.browen, size: 30),
        SizedBox(width: 15),
        Text(
          S.of(context).Notifications,
          style: AppStyles.textStyle18(
            context,
          ).copyWith(fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Icon(Icons.notifications, size: 20, color: context.appColors.orange),
        Transform.scale(
          scale: .8,
          child: Switch(
            value: false,
            onChanged: (value) {},
            activeColor: context.appColors.white,
            activeTrackColor: context.appColors.browen,
            inactiveThumbColor: context.appColors.white,
            inactiveTrackColor: context.appColors.orange,
          ),
        ),
        Icon(
          Icons.notifications_off,
          size: 20,
          color: context.appColors.browen,
        ),
      ],
    );
  }
}
