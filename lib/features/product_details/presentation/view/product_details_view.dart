import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/home/data/models/product_model.dart';
import 'package:store/features/product_details/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:store/features/product_details/presentation/view/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Product Details", context: context),
      body: BlocProvider(
        create: (context) => AddToCartCubit(),
        child: ProductDetailsViewBody(product: product),
      ),
    );
  }
}
