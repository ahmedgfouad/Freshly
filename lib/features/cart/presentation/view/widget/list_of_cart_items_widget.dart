import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/widgets/custom_loading_indecator.dart';
import 'package:store/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:store/features/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:store/features/cart/presentation/view/widget/cart_item_widget.dart';

class ListOfCartItemsWidget extends StatelessWidget {
  const ListOfCartItemsWidget({super.key, required this.listOfCartProducts});
  final List listOfCartProducts;

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);
    return BlocBuilder<CartCubit, CartState>(
      bloc: cartCubit,
      buildWhen:
          (previous, current) =>
              current is DeleteCartFailedState ||
              current is DeleteCartLoadingState ||
              current is DeleteCartSuccessState,
      builder: (context, state) {
        if (state is DeleteCartLoadingState) {
          return CustomLoadingIndecator();
        } else if (state is DeleteCartFailedState) {
          return Text(state.error);
        } else if (state is DeleteCartSuccessState ||
            state is CartSuccsessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            child: ListView.builder(
              itemBuilder:
                  (context, index) => Dismissible(
                    onDismissed: (v) {
                      cartCubit.deleteCart(listOfCartProducts[index]);
                    },
                    key: ValueKey(listOfCartProducts[index]),
                    background: Container(
                      decoration: BoxDecoration(
                        color: AppColors().browen,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(
                        Icons.delete_outline,
                        color: AppColors().white,
                      ),
                    ),
                    child: CartItemWidget(product: listOfCartProducts[index]),
                  ),
              itemCount: listOfCartProducts.length,
            ),
          );
        } else {
          return Text("error ");
        }
      },
    );
  }
}
