import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/utils/app_router.dart';
import 'package:store/core/widgets/custom_loading_indecator.dart';
import 'package:store/core/widgets/custom_search_text_form_field.dart';
import 'package:store/features/explore/presentation/manager/explore_cubit/explore_cubit.dart';
import 'package:store/features/explore/presentation/manager/explore_cubit/explore_state.dart';

class ExploreViewBody extends StatelessWidget {
  const ExploreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final explorecubit = BlocProvider.of<ExploreCubit>(context);
    return BlocBuilder<ExploreCubit, ExploreState>(
      bloc: explorecubit,
      buildWhen:
          (previous, current) =>
              current is ExploreLoading ||
              current is ExploreSuccess ||
              current is ExploreFailed,
      builder: (context, state) {
        if (state is ExploreLoading) {
          return CustomLoadingIndecator();
        } else if (state is ExploreFailed) {
          return Text(state.error);
        } else if (state is ExploreSuccess) {
          final explores = state.explore;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomSearchTextFormFieldWidget(),
                  SizedBox(height: 10),
                  GridView.count(
                    crossAxisCount: 3, // 3 صور في الصف
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(explores.length, (index) {
                      return GestureDetector(
                        onTap: () { 
                          GoRouter.of(context).push(
                            AppRouter.kCategoriesView,
                            extra: explores[index].name,
                          );
                        },
                        child: SvgPicture.network(explores[index].imageUrl),
                      );
                    }),
                  ),
                ],
              ),
            ),
          );
        } else {
          return CustomLoadingIndecator();
        }
      },
    );
  }
}
