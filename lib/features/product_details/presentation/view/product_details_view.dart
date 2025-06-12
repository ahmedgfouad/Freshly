import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/home/data/models/product_model.dart';
import 'package:store/features/product_details/data/services/add_to_cart_services.dart';
import 'package:store/features/product_details/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:store/features/product_details/presentation/view/widgets/product_details_view_body.dart';
import 'package:store/generated/l10n.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: S.of(context).ProductDetails,
        context: context,
      ),
      body: BlocProvider(
        create: (context) => AddToCartCubit(AddToCartServicesImpl()),
        child: ProductDetailsViewBody(product: product),
      ),
    );
  }
}
