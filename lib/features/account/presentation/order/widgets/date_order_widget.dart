
import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';

class DateOrderWidget extends StatelessWidget {
  const DateOrderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.date_range_outlined, color: AppColors().browen),
        SizedBox(width: 10),
        Text(
          "March 5, 2025",
          style: AppStyles.textStyle18.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Text(
          "6:30 pm",
          style: AppStyles.textStyle14.copyWith(
            color: AppColors().orange,
          ),
        ),
      ],
    );
  }
}
