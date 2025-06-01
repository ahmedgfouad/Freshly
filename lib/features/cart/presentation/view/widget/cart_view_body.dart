import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/images.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/core/widgets/custom_buton.dart';
import 'package:store/core/widgets/custom_emty_page_widget.dart';
import 'package:store/core/widgets/custom_loading_indecator.dart';
import 'package:store/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:store/features/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:store/features/cart/presentation/view/widget/list_of_cart_items_widget.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);
    return BlocBuilder(
      bloc: cartCubit,
      buildWhen:
          (previous, current) =>
              current is DeleteCartSuccessState ||
              current is CartSuccsessState ||
              current is CartSuccsessState ||
              current is CartFailedState,
      builder: (context, state) {
        if (state is CartLoadingState) {
          return CustomLoadingIndecator();
        } else if (state is CartFailedState) {
          return Center(child: Text("failed"));
        } else if (state is CartSuccsessState) {
          final productsCart = state.myProductsCart;
          num totalP = 0;
          for (var element in productsCart) {
            totalP = totalP + element.totalPrice;
          }
          return productsCart.isNotEmpty
              ? Column(
                children: [
                  Expanded(
                    child: ListOfCartItemsWidget(
                      listOfCartProducts: productsCart,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Price ",
                            style: AppStyles.textStyle20.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "$totalP ُEGP",
                            style: AppStyles.textStyle20.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors().orange,
                            ),
                          ),
                        ],
                      ),
                      CustomButon(text: "Check Out", onPressed: () {}),
                    ],
                  ),
                ],
              )
              : CustomEmptyPage(
                image: AppImages.welcomImg,
                title: "Your Cart is empty",
                subTitle: "Start filling your shopping cart",
              );
        } else {
          return Text("data in  cart");
        }
      },
    );
  }
}
