import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/products/presentation/manager/cubit/products_cubit.dart';
import 'package:store/features/products/presentation/views/widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Products", context: context),
      body: BlocProvider(
        create: (context) {
          final cubit = ProductsCubit();
          cubit.getCategoryProducts(categoryName: categoryName);
          return cubit;
        },
        child: ProductsViewBody(),
      ),
    );
  }
}
