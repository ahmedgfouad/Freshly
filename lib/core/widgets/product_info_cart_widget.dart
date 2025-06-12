import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/utils/app_router.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/features/home/data/models/product_model.dart';
import 'package:store/generated/l10n.dart';

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
        width: MediaQuery.of(context).size.width / 2.3,
        padding: EdgeInsets.symmetric(horizontal: 11),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: context.appColors.white,
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
              child: CachedNetworkImage(
                imageUrl: product.imageUrl,
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 6,
                fit: BoxFit.contain,
              ),
            ),
            Spacer(),
            Text(
              product.name,
              style: AppStyles.textStyle18(
                context,
              ).copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              S.of(context).KgPriceg,
              style: AppStyles.textStyle12(
                context,
              ).copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${S.of(context).EGP} ${product.price}",
                  style: AppStyles.textStyle22(context),
                ),
                CircleAvatar(
                  radius: 15.r,
                  backgroundColor: context.appColors.green,
                  child: Icon(Icons.add, color: context.appColors.white),
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
