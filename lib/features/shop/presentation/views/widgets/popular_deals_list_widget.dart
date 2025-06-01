import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/custom_loading_indecator.dart';
import 'package:store/core/widgets/product_info_cart_widget.dart';
import 'package:store/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:store/features/home/presentation/manager/home_cubit/home_state.dart';

class PopularDealsListWidget extends StatelessWidget {
  const PopularDealsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final shopCubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
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
            height: MediaQuery.of(context).size.height / 3.3,
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
          return Text("error");
        }
      },
    );
  }
}
