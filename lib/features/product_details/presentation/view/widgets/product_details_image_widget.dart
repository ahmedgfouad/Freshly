import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store/core/thems/colors.dart';
import 'package:store/features/home/data/models/product_model.dart';

class ProductDetailsImageWidget extends StatelessWidget {
  const ProductDetailsImageWidget({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: CachedNetworkImage(
          imageUrl: product.imageUrl,
          placeholder:
              (context, url) => Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 4, 
                color: context.appColors.offWhite,
              ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
