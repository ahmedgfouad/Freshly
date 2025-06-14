
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/utils/constants.dart';
import 'package:store/features/home/data/models/product_model.dart';
import 'package:store/features/home/data/models/save_product_model.dart';
import 'package:store/features/product_details/data/services/add_to_favorite_services.dart';
import 'package:store/features/product_details/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:store/features/product_details/presentation/manager/add_to_favorite_cubit/add_to_favorite_cubit.dart';
import 'package:store/features/product_details/presentation/view/widgets/count_of_product_widget.dart';
import 'package:store/features/product_details/presentation/view/widgets/favourite_icon_widget.dart';

class ProductDetailsCounterAndFavoriteIconWidget extends StatelessWidget {
  const ProductDetailsCounterAndFavoriteIconWidget({
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
        CountOfProdutWidget(width: MediaQuery.of(context).size.width / 1.3),
        BlocProvider(
          create: (context) => AddToFavoriteCubit(AddToFavoriteServicesImpl( 
          )),
          child: FavouriteIconWidet(
            product: SaveProductModel(
              id: documentIdFromLocalData(),
              productId: product.id,
              name: product.name,
              category: product.category,
              imageUrl: product.imageUrl,
              price: product.price,
              quantity: addToCardCubit.quantity,
              totalPrice: product.price * addToCardCubit.quantity,
            ),
          ),
        ),
      ],
    );
  }
}
