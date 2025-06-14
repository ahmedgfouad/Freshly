import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/constants.dart';
import 'package:store/core/utils/images.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/core/widgets/custom_buton.dart';
import 'package:store/core/widgets/custom_emty_page_widget.dart';
import 'package:store/core/widgets/custom_loading_indecator.dart';
import 'package:store/features/cart/data/models/amoun_model/amount_model.dart';
import 'package:store/features/cart/data/models/amoun_model/details.model.dart';
import 'package:store/features/cart/data/models/item_list_model/item.dart';
import 'package:store/features/cart/data/models/item_list_model/item_list_model.dart';
import 'package:store/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:store/features/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:store/features/cart/presentation/view/widget/list_of_cart_items_widget.dart';
import 'package:store/generated/l10n.dart';

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
                            S.of(context).TotalPrice,
                            style: AppStyles.textStyle20(
                              context,
                            ).copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "$totalP ${S.of(context).EGP}",
                            style: AppStyles.textStyle20(context).copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.appColors.orange,
                            ),
                          ),
                        ],
                      ),
                      CustomButon(
                        text: S.of(context).CheckOut,
                        onPressed: () {
                          var amount = AmountModel(
                            total: "$totalP",
                            currency: "USD",
                            details: DetailsAmountModel(
                              shipping: "0",
                              shippingDiscount: 0,
                              subtotal: "$totalP",
                            ),
                          );
                          List<OrderItemModel> orders = [];
                          for (var element in productsCart) {
                            orders.add(
                              OrderItemModel(
                                name: element.name,
                                quantity: (element.quantity).toInt(),
                                price: "${element.price}",
                                currency: "USD",
                              ),
                            );
                          }

                          var itemList = ItemListModel(orders: orders);

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:
                                  (BuildContext context) => PaypalCheckoutView(
                                    sandboxMode: true,
                                    clientId: paypalClientId,
                                    secretKey: paypalSecretKey,
                                    transactions: [
                                      {
                                        "amount": amount.toJson(),
                                        "description":
                                            "The payment transaction description.",
                                        "item_list": itemList.toJson(),
                                      },
                                    ],
                                    note:
                                        "Contact us for any questions on your order.",
                                    onSuccess: (Map params) async {
                                      Navigator.pop(context);
                                    },
                                    onError: (error) {

                                      Navigator.pop(context);
                                    },
                                    onCancel: () {

                                      Navigator.pop(context);
                                    },
                                  ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              )
              : CustomEmptyPage(
                image: AppImages.welcomImg,
                title: S.of(context).EmptyCart,
                subTitle: S.of(context).StartFillingCart,
              );
        } else {
          return Text("data in  cart");
        }
      },
    );
  }
}
