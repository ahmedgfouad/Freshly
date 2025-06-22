import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/thems/colors.dart';
import 'package:store/core/thems/styles.dart';
import 'package:store/core/widgets/custom_loading_indecator.dart';
import 'package:store/features/home/data/models/product_model.dart';
import 'package:store/features/product_details/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:store/features/product_details/presentation/manager/add_to_cart_cubit/add_to_cart_state.dart';
import 'package:store/features/product_details/presentation/view/widgets/add_to_cart_buton_widget.dart';
import 'package:store/features/product_details/presentation/view/widgets/product_details_counter_and_favorite_icon_widget.dart';
import 'package:store/features/product_details/presentation/view/widgets/product_details_image_widget.dart';
import 'package:store/features/product_details/presentation/view/widgets/product_details_price_widget.dart';
import 'package:store/generated/l10n.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final addToCardCubit = BlocProvider.of<AddToCartCubit>(context);

    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, bottom: 30),
      child: BlocConsumer<AddToCartCubit, AddToCartState>(
        bloc: addToCardCubit,
        listenWhen: (previous, current) => current is AddToCartSuccessState,
        listener: (context, state) {
          if (state is AddToCartSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(S.of(context).AddToCart),
                duration: Duration(milliseconds: 500),
                backgroundColor: context.appColors.browen,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductDetailsImageWidget(product: product),
                Text(product.name, style: AppStyles.textStyle24(context)),
                const SizedBox(height: 6),
                ProductDetailsPriceWidget(
                  product: product,
                  addToCardCubit: addToCardCubit,
                ),
                const SizedBox(height: 8),
                Text(product.aboute, style: AppStyles.textStyle14(context)),
                Spacer(),
                ProductDetailsCounterAndFavoriteIconWidget(
                  product: product,
                  addToCardCubit: addToCardCubit,
                ),
                Spacer(),
                AddToCartButonWidget(
                  addToCardCubit: addToCardCubit,
                  product: product,
                ),
              ],
            );
          } else {
            return Text("error");
          }
        },
      ),
    );
  }
}
