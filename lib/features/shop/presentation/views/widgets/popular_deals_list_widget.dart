import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/custom_loading_indecator.dart';
import 'package:store/core/widgets/product_info_cart_widget.dart';
import 'package:store/features/shop/presentation/manager/cubit/shop_cubit.dart';
import 'package:store/features/shop/presentation/manager/cubit/shop_state.dart';

class PopularDealsListWidget extends StatelessWidget {
  const PopularDealsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final shopCubit = BlocProvider.of<ShopCubit>(context);
    return BlocBuilder<ShopCubit, ShopState>(
      bloc: shopCubit,
      buildWhen:
          (previous, current) =>
              current is ShopLoading ||
              current is ShopSuccess ||
              current is ShopFailed,
      builder: (context, state) {
        if (state is ShopLoading) {
          return CustomLoadingIndecator();
        } else if (state is ShopFailed) {
          return Center(child: Text(state.error));
        } else if (state is ShopSuccess) {
          final products = state.products;
          return SizedBox(
            height: 164,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder:
                  (context, index) =>
                      ProductInfoCartWidget(product: products[index]),
              separatorBuilder: (context, index) => SizedBox(width: 5),
              itemCount: products.length,
            ),
          );
        } else {
          return CustomLoadingIndecator();
        }
      },
    );
  }
}
