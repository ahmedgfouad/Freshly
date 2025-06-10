import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/cart/data/services/cart_services.dart';
import 'package:store/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:store/features/cart/presentation/view/widget/cart_view_body.dart';
import 'package:store/generated/l10n.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: S.of(context).Cart, context: context, arrowBack: false),
      body: BlocProvider(
        create: (context)=>CartCubit(CartServicesImpl()) ,
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, bottom: 10),
          child: CartViewBody(),
        ),
      ),
    );
  }
}
