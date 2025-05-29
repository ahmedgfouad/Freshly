import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/utils/app_router.dart';
import 'package:store/core/widgets/custom_loading_indecator.dart';
import 'package:store/core/widgets/custom_search_text_form_field.dart';
import 'package:store/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:store/features/home/presentation/manager/home_cubit/home_state.dart';

class ExploreViewBody extends StatelessWidget {
  const ExploreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final explorecubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: explorecubit,
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
          final explores = state.catrgories;
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
