import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/thems/colors.dart';
import 'package:store/core/widgets/custom_loading_indecator.dart';
import 'package:store/features/home/data/models/save_product_model.dart';
import 'package:store/features/product_details/presentation/manager/add_to_cart_cubit/add_to_cart_state.dart';
import 'package:store/features/product_details/presentation/manager/add_to_favorite_cubit/add_to_favorite_cubit.dart';
import 'package:store/features/product_details/presentation/manager/add_to_favorite_cubit/add_to_favorite_state.dart';

class FavouriteIconWidet extends StatelessWidget {
  const FavouriteIconWidet({super.key, required this.product});
  final SaveProductModel product;
  @override
  Widget build(BuildContext context) {
    final addToFavoriteCubit = BlocProvider.of<AddToFavoriteCubit>(context);
    return BlocBuilder<AddToFavoriteCubit, AddToFavoriteState>(
      bloc: addToFavoriteCubit,
      buildWhen:
          (previous, current) =>
              current is AddToCartInitial ||
              current is AddToFavoriteLoadingState ||
              current is AddToFavoriteSuccessState ||
              current is AddToFavoriteFailedState,
      builder: (context, state) {
        if (state is AddToFavoriteLoadingState) {
          return CustomLoadingIndecator();
        } else if (state is AddToFavoriteFailedState) {
          return Text(state.error);
        } else if (state is AddToFavoriteSuccessState ||
            state is AddToFavoriteInitial) {
          return IconButton(
            onPressed: () async {
              await addToFavoriteCubit.addToFavorite(product);
            },
            icon:
                addToFavoriteCubit.isFavorite
                    ? Icon(
                      Icons.favorite,
                      size: 35,
                      color: context.appColors.orange,
                    )
                    : Icon(
                      Icons.favorite_border,
                      size: 35,
                      color: context.appColors.orange,
                    ),
          );
        } else {
          return Text("error");
        }
      },
    );
  }
}
