
import 'package:flutter/material.dart';
import 'package:store/core/thems/colors.dart';
import 'package:store/core/thems/styles.dart';
import 'package:store/features/home/data/models/product_model.dart';
import 'package:store/features/product_details/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:store/generated/l10n.dart';

class ProductDetailsPriceWidget extends StatelessWidget {
  const ProductDetailsPriceWidget({
    super.key,
    required this.product,
    required this.addToCardCubit,
  });

  final ProductModel product;
  final AddToCartCubit addToCardCubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(S.of(context).KgPriceg, style: AppStyles.textStyle18(context)),
            Text(
              " ${product.price} ${S.of(context).EGP}",
              style: AppStyles.textStyle18(context).copyWith(
                color: context.appColors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              " ${S.of(context).TotalPrice}:",
              style: AppStyles.textStyle16(context),
            ),
            Text(
              " ${product.price * addToCardCubit.quantity} /EGP",
              style: AppStyles.textStyle18(context).copyWith(
                color: context.appColors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
