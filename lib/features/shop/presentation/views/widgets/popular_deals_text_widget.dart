import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/generated/l10n.dart';

class PopularDealsTextWidget extends StatelessWidget {
  const PopularDealsTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).PopularDeals,
            style: AppStyles.textStyle24(context),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              S.of(context).seeAll,
              style: AppStyles.textStyle18(
                context,
              ).copyWith(color: context.appColors.orange),
            ),
          ),
        ],
      ),
    );
  }
}
