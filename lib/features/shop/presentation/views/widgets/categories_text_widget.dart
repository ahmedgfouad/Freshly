import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/features/home/presentation/manager/home_cubit/home_cubit.dart';

class CategoriesTextWidget extends StatelessWidget {
  const CategoriesTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Categories", style: AppStyles.textStyle24),
          TextButton(
            onPressed: () {
              final homeCubit = BlocProvider.of<HomeCubit>(context);
              homeCubit.changeIndex(1);
            },
            child: Text(
              "see all",
              style: AppStyles.textStyle18.copyWith(color: AppColors().orange),
            ),
          ),
        ],
      ),
    );
  }
}
