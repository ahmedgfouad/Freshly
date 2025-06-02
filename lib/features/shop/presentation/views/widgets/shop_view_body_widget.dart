import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/shop/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:store/features/shop/presentation/manager/popular_cubit/popular_cubit.dart';
import 'package:store/features/shop/presentation/views/widgets/carousel_slider_widget.dart';
import 'package:store/features/shop/presentation/views/widgets/categories_list_widget.dart';
import 'package:store/features/shop/presentation/views/widgets/categories_text_widget.dart';
import 'package:store/features/shop/presentation/views/widgets/popular_deals_list_widget.dart';
import 'package:store/features/shop/presentation/views/widgets/popular_deals_text_widget.dart';

class ShopViewBodyWidget extends StatelessWidget {
  const ShopViewBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CarouselSliderWidget(),
              SizedBox(height: 15),
              CategoriesTextWidget(),
              BlocProvider(
                create: (context) {
                  final cubit = CategoriesCubit();
                  cubit.getCategories();
                  return cubit;
                },
                child: CategoriesListWidget(),
              ),
              SizedBox(height: 15),
              PopularDealsTextWidget(),
              SizedBox(height: 15),
            ],
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: BlocProvider(
              create: (context) {
                final cubit = PopularCubit();
                cubit.getShopProducts();
                return cubit;
              },
              child: PopularDealsListWidget(),
            ),
          ),
        ),
      ],
    );
  }
}
