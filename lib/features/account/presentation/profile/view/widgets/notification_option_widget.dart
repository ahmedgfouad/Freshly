import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';

class NotificationOptionWidget extends StatelessWidget {
  const NotificationOptionWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: AppColors().browen, size: 30),
        SizedBox(width: 15),
        Text(
          title,
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
