import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/core/widgets/custom_loading_indecator.dart';
import 'package:store/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:store/features/home/presentation/manager/home_cubit/home_state.dart';

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final categorCubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: categorCubit,
      buildWhen:
          (previous, current) =>
              current is CatrgoriesLoading ||
              current is CatrgoriesSuccess ||
              current is CatrgoriesFailed,
      builder: (context, state) {
        if (state is CatrgoriesLoading) {
          return CustomLoadingIndecator();
        } else if (state is CatrgoriesFailed) {
          return Text(state.error);
        } else if (state is CatrgoriesSuccess) {
          final categories = state.catrgories;
          return SizedBox(
            height: 130,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder:
                  (context, index) =>
                      SvgPicture.network(categories[index].imageUrl),
              separatorBuilder: (context, index) => SizedBox(width: 5),
              itemCount: categories.length,
            ),
          );
        } else {
          return Text("error");
        }
      },
    );
  }
}
