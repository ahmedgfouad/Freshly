import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/utils/constants.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/core/widgets/custom_buton.dart';
import 'package:store/core/widgets/custom_loading_indecator.dart';
import 'package:store/features/home/data/models/product_model.dart';
import 'package:store/features/home/data/models/save_product_model.dart';
import 'package:store/features/product_details/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:store/features/product_details/presentation/manager/add_to_cart_cubit/add_to_cart_state.dart';
import 'package:store/features/product_details/presentation/manager/add_to_favorite_cubit/add_to_favorite_cubit.dart';
import 'package:store/features/product_details/presentation/view/widgets/count_of_product_widget.dart';
import 'package:store/features/product_details/presentation/view/widgets/favourite_icon_widget.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final addToCardCubit = BlocProvider.of<AddToCartCubit>(context);
    final productModel = SaveProductModel(
      id: documentIdFromLocalData(),
      productId: product.id,
      name: product.name,
      category: product.category,
      imageUrl: product.imageUrl,
      price: product.price,
      quantity: '3',
    );
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: Center(
              child: Image.network(product.imageUrl, fit: BoxFit.cover),
            ),
          ),
          Text(product.name, style: AppStyles.textStyle24),
          SizedBox(height: 6),
          Text("\$ ${product.price} /st", style: AppStyles.textStyle18),
          SizedBox(height: 8),
          Text(product.aboute, style: AppStyles.textStyle14),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CountOfProdutWidget(
                width: MediaQuery.of(context).size.width / 1.3,
              ),
              BlocProvider(
                create: (context) => AddToFavoriteCubit(),
                child: FavouriteIconWidet(product: productModel),
              ),
            ],
          ),
          Spacer(),
          BlocConsumer<AddToCartCubit, AddToCartState>(
            bloc: addToCardCubit,
            listenWhen: (previous, current) => current is AddToCartSuccessState,
            listener: (context, state) {
              if (state is AddToCartSuccessState) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Added to cart")));
              }
            },
            buildWhen:
                (previous, current) =>
                    current is AddToCartInitial ||
                    current is AddToCartLoadingState ||
                    current is AddToCartSuccessState ||
                    current is AddToCartFailedState,
            builder: (context, state) {
              if (state is AddToCartLoadingState) {
                return CustomLoadingIndecator();
              } else if (state is AddToCartFailedState) {
                return Text(state.error);
              }
              if (state is AddToCartSuccessState || state is AddToCartInitial) {
                return CustomButon(
                  text: "Add To Cart",
                  onPressed: () {
                    addToCardCubit.addCartToFirestore(productModel);
                    // navigateTo(AppRouter.kCartView, context);
                  },
                );
              } else {
                return Text("data");
              }
            },
          ),
        ],
      ),
    );
  }
}
