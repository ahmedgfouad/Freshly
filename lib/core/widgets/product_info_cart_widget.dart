import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/utils/app_router.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/features/home/data/models/product_model.dart';

class ProductInfoCartWidget extends StatelessWidget {
  const ProductInfoCartWidget({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(
          context,
        ).push(AppRouter.kProductDetailsView, extra: product);
      },
      child: Container(
        width: 150,
        height: 164,
        padding: EdgeInsets.symmetric(horizontal: 11),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 20,
              offset: Offset(10, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(product.imageUrl, width: 70, height: 70),
            ),
            Spacer(),
            Text(
              product.name,
              style: AppStyles.textStyle14.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "1kg,priceg",
              style: AppStyles.textStyle12.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$ ${product.price}",
                  style: AppStyles.textStyle18.copyWith(
                    color: AppColors().orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColors().green,
                  child: Icon(Icons.add, color: AppColors().white),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
