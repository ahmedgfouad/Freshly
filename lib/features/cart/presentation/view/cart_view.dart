import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:store/features/cart/presentation/view/widget/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Cart", context: context, arrowBack: false),
      body: BlocProvider(
        create: (context)=>CartCubit() ,
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, bottom: 10),
          child: CartViewBody(),
        ),
      ),
    );
  }
}
