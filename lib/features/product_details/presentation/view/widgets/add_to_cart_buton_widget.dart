
import 'package:flutter/material.dart';
import 'package:store/core/utils/constants.dart';
import 'package:store/core/widgets/custom_buton.dart';
import 'package:store/features/home/data/models/product_model.dart';
import 'package:store/features/home/data/models/save_product_model.dart';
import 'package:store/features/product_details/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:store/generated/l10n.dart';

class AddToCartButonWidget extends StatelessWidget { 
  const AddToCartButonWidget({
    super.key,
    required this.addToCardCubit,
    required this.product,
  });

  final AddToCartCubit addToCardCubit;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return CustomButon(
      text: S.of(context).AddToCart,
      onPressed: () {
        addToCardCubit.addCartToFirestore(
          SaveProductModel(
            id: documentIdFromLocalData(),
            productId: product.id,
            name: product.name,
            category: product.category,
            imageUrl: product.imageUrl,
            price: product.price,
            quantity: addToCardCubit.quantity,
            totalPrice: product.price * addToCardCubit.quantity,
          ),
        );
        // navigateTo(AppRouter.kCartView, context);
      },
    );
  }
}
