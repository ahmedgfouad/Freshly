import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/features/product_details/data/models/add_to_cart_model.dart';
import 'package:store/features/product_details/presentation/view/widgets/count_of_product_widget.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.cartProduct});
  final AddToCartModel cartProduct;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors().white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(cartProduct.imageUrl, width: 60),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                cartProduct.name,
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
                "\$${cartProduct.price}",
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
