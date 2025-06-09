import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/features/home/data/models/save_product_model.dart';
import 'package:store/generated/l10n.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.product});
  final SaveProductModel product;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors().white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(imageUrl: product.imageUrl, width: 60),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: AppStyles.textStyle18.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "${S.of(context).EGP} ${product.price}",
                      style: AppStyles.textStyle18.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                       S.of(context).kg,
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
                  "${S.of(context).Quantity} : \$${product.quantity} ${S.of(context).kg}",
                  style: AppStyles.textStyle14.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "${S.of(context).Price} : \$${product.totalPrice}",
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
