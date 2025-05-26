import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/images.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/features/product_details/presentation/view/widgets/count_of_product_widget.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors().white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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
              Transform.scale(
                scale: .7,
                child: CountOfProdutWidget(
                  width: MediaQuery.of(context).size.width / 2,
                ),
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
