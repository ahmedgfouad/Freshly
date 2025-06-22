import 'package:flutter/material.dart';
import 'package:store/core/thems/colors.dart';
import 'package:store/core/thems/styles.dart';

class ItemOrderHistoryWidget extends StatelessWidget {
  const ItemOrderHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.appColors.white,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Icon(
              Icons.shopping_basket_outlined,
              color: context.appColors.orange,
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Order #345", style: AppStyles.textStyle18(context)),
                Text(
                  "Delivered",
                  style: AppStyles.textStyle14(
                    context,
                  ).copyWith(color: context.appColors.green),
                ),
                Text("October 26, 2014", style: AppStyles.textStyle14(context)),
              ],
            ),
            Spacer(),
            Text(
              r"$700",
              style: AppStyles.textStyle18(context).copyWith(
                color: context.appColors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
