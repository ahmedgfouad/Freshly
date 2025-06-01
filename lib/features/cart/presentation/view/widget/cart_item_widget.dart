import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/features/home/data/models/save_product_model.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.cartProduct});
  final SaveProductModel cartProduct;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors().white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(imageUrl: cartProduct.imageUrl, width: 60),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartProduct.name,
                  style: AppStyles.textStyle18.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "EGP ${cartProduct.price}",
                      style: AppStyles.textStyle18.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
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
            Spacer(),
            Column(
              children: [
                Text(
                  "Quantity : \$${cartProduct.quantity} kg",
                  style: AppStyles.textStyle14.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Total Price : \$${cartProduct.totalPrice}",
                  style: AppStyles.textStyle14.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors().orange,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
