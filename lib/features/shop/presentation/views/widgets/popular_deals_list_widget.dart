import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/product_info_cart_widget.dart';
import 'package:store/features/shop/presentation/manager/popular_cubit/popular_cubit.dart';
import 'package:store/features/shop/presentation/manager/popular_cubit/popular_state.dart';
import 'package:store/features/shop/presentation/views/widgets/custom_popular_loading_widget.dart';

class PopularDealsListWidget extends StatelessWidget {
  const PopularDealsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final shopCubit = BlocProvider.of<PopularCubit>(context);
    return BlocBuilder<PopularCubit,PopularState>(
      bloc: shopCubit,
      buildWhen:
          (previous, current) =>
              current is PopularLoadingState ||
              current is PopularSuccessState ||
              current is PopularFailedState,
      builder: (context, state) {
        if (state is PopularLoadingState) {
          return CustomPopularLoadingWidget();
        } else if (state is PopularFailedState) {
          return Center(child: Text(state.error));
        } else if (state is PopularSuccessState) {
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
          return CustomPopularLoadingWidget();
        }
      },
    );
  }
}


