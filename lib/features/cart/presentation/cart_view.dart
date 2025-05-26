import 'package:flutter/material.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/cart/presentation/widget/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key, });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Cart", context: context, arrowBack: false),
      body: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15, bottom: 10),
        child: CartViewBody(),
      ),
    );
  }
}
