import 'package:flutter/material.dart';
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
              CategoriesListWidget(),
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
            child: PopularDealsListWidget(),
          ),
        ),
      ],
    );
  }
}
