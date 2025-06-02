import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/core/utils/app_router.dart';
import 'package:store/features/shop/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:store/features/shop/presentation/manager/categories_cubit/categories_state.dart';

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final categorCubit = BlocProvider.of<CategoriesCubit>(context);
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      bloc: categorCubit,
      buildWhen:
          (previous, current) => 
              current is CatrgoriesLoading ||
              current is CatrgoriesSuccess ||
              current is CatrgoriesFailed,
      builder: (context, state) {
        if (state is CatrgoriesLoading) {
          return CustomShimmerLoading();
        } else if (state is CatrgoriesFailed) {
          return Text(state.error);
        } else if (state is CatrgoriesSuccess) {
          final categories = state.catrgories;
          return SizedBox(
            height: MediaQuery.of(context).size.height / 5,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder:
                  (context, index) => GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRouter.kCategoriesView,
                        extra: categories[index].name,
                      );
                    },
                    child: SvgPicture.network(categories[index].imageUrl),
                  ),
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

class CustomShimmerLoading extends StatelessWidget {
  const CustomShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: 5,
        itemBuilder:
            (context, index) => Shimmer.fromColors(
              baseColor: Colors.red,
              highlightColor: Colors.yellow,
              child: CircleAvatar(radius: 40),
            ),
      ),
    );
  }
}
