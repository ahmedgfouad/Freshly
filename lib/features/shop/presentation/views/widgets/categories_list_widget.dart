import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/utils/app_router.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/shop/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:store/features/shop/presentation/manager/categories_cubit/categories_state.dart';
import 'package:store/features/shop/presentation/views/widgets/custom_categories_loding_widget.dart';

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
          return CustomCategoriesLoadingWidget();
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
                    child: CachedNetworkImage(
                      imageUrl: categories[index].imageUrl,
                      placeholder:
                          (context, url) => CircleAvatar(
                            radius: 50.r,
                            backgroundColor: context.appColors.offWhite,
                          ),
                      errorWidget:
                          (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
              separatorBuilder: (context, index) => SizedBox(width: 5),
              itemCount: categories.length,
            ),
          );
        } else {
          return CustomCategoriesLoadingWidget();
        }
      },
    );
  }
}
