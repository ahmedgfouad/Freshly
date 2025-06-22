import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/thems/colors.dart';
import 'package:store/core/thems/styles.dart';
import 'package:store/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:store/generated/l10n.dart';

class CategoriesTextWidget extends StatelessWidget {
  const CategoriesTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(S.of(context).Categories, style: AppStyles.textStyle24(context)),
          TextButton(
            onPressed: () {
              final homeCubit = BlocProvider.of<HomeCubit>(context);
              homeCubit.changeIndex(1);
            },
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
