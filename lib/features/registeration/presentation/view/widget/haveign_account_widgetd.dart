
import 'package:flutter/material.dart';
import 'package:store/core/theme/colors.dart';
import 'package:store/core/theme/styles.dart';

class HaveingAccountWidget extends StatelessWidget {
  const HaveingAccountWidget({
    super.key,
    required this.question,
    required this.nextPage,
  });
  final String question, nextPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(question, style: AppStyles.textStyle14(context)),
        const SizedBox(width: 5),
        Text(
          nextPage,
          style: AppStyles.textStyle14(
            context,
          ).copyWith(color: context.appColors.orange),
        ),
      ],
    );
  }
}
