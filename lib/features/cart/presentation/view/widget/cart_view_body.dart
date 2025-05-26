import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/utils/images.dart';
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
          return productsCart.isNotEmpty
              ? CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: ListOfCartItemsWidget(
                      listOfCartProducts: productsCart,
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Align(
                      child: CustomButon(text: "Check Out", onPressed: () {}),
                    ),
                  ),
                ],
              )
              : CustomEmptyPage(
                image: AppImages.welcomImg,
                title: "Your Cart is empty",
                subTitle: "Start filling your shopping cart",
              );
        } else {
          return Text("data");
        }
      },
    );
  }
}
