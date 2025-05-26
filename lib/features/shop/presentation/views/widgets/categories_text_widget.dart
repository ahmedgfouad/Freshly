import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';

class CategoriesTextWidget extends StatelessWidget {
  const CategoriesTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Categories", style: AppStyles.textStyle24),
          TextButton(
            onPressed: () {},
            child: Text(
              "see all",
              style: AppStyles.textStyle18.copyWith(
                color: AppColors().orange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
