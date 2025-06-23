import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/theme/colors.dart';
import 'package:store/core/theme/styles.dart';
import 'package:store/features/product_details/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:store/features/product_details/presentation/manager/add_to_cart_cubit/add_to_cart_state.dart';

class CountOfProdutWidget extends StatelessWidget {
  final double width; // Assuming you want to pass width as a parameter

  const CountOfProdutWidget({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    final addToCardCubit = BlocProvider.of<AddToCartCubit>(context);
    return BlocBuilder<AddToCartCubit, AddToCartState>(
      bloc: addToCardCubit,
      buildWhen:
          (previous, current) =>
              current is AddToCartInitial ||
              current is ChangeQuantitySuccessState,
      builder: (context, state) {
        if (state is AddToCartInitial || state is ChangeQuantitySuccessState) {
          return Container(
            width: width,
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 50,
            decoration: BoxDecoration(
              color: context.appColors.offWhite,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: context.appColors.orange,
                  child: IconButton(
                    onPressed: () {
                      addToCardCubit.changeQuantity(
                        addToCardCubit.quantity + 1,
                      );
                    },
                    icon: Icon(Icons.add, color: context.appColors.white),
                  ),
                ),
                Text(
                  "${addToCardCubit.quantity}",
                  style: AppStyles.textStyle18(context),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: context.appColors.orange,
                  child: IconButton(
                    onPressed: () {
                      if (addToCardCubit.quantity > 1) {
                        addToCardCubit.changeQuantity(
                          addToCardCubit.quantity - 1,
                        );
                      }
                    },
                    icon: Icon(Icons.remove, color: context.appColors.white),
                  ),
                ),
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
