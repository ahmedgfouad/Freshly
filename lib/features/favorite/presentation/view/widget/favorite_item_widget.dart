import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/features/home/data/models/save_product_model.dart';

class FavoriteItemWidget extends StatelessWidget {
  const FavoriteItemWidget({super.key, required this.product});

  final SaveProductModel product;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors().white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CachedNetworkImage(imageUrl: product.imageUrl, width: 70),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                product.name,
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
                "\$${product.price}",
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
