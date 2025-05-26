import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:store/core/widgets/product_info_cart_widget.dart';
import 'package:store/features/home/data/models/product_model.dart';

class GridOfProductInfoCartWidget extends StatelessWidget {
  const GridOfProductInfoCartWidget({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2, // عمودين
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.only(top: index.isEven ? 0 : 20),
          height: index.isEven ? 190 : 220, // عشان ندي شكل staggered
          child: ProductInfoCartWidget(
            product: products[index],
          ),
        );
      },
    );
  }
}
