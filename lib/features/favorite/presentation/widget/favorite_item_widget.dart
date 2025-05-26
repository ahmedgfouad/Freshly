import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/images.dart';
import 'package:store/core/utils/styles.dart';

class FavoriteItemWidget extends StatelessWidget {
  const FavoriteItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors().white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(AppImages.appleImg),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Red Apple",
                style: AppStyles.textStyle18.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, color: AppColors().orange),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Add to cart",
                      style: AppStyles.textStyle14.copyWith(
                        color: AppColors().orange,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          Row(
            children: [
              Text(
                r"$4,99",
                style: AppStyles.textStyle18.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5),
              Text(
                "kg",
                style: AppStyles.textStyle12.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors().browen,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
