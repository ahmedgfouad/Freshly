
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store/features/home/data/models/product_model.dart';

class ProductDetailsImageWidget extends StatelessWidget {
  const ProductDetailsImageWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: CachedNetworkImage(
          imageUrl: product.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
