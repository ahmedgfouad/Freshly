
import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';

class ItemOrderHistoryWidget extends StatelessWidget {
  const ItemOrderHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors().white,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Icon(Icons.shopping_basket_outlined, color: AppColors().orange),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Order #345", style: AppStyles.textStyle18),
                Text(
                  "Delivered",
                  style: AppStyles.textStyle14.copyWith(
                    color: AppColors().green,
                  ),
                ),
                Text("October 26, 2014", style: AppStyles.textStyle14),
              ],
            ),
            Spacer(),
            Text(
              r"$700",
              style: AppStyles.textStyle18.copyWith(
                color: AppColors().orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
