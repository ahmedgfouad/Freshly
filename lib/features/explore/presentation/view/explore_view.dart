import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/explore/presentation/view/widget/explore_view_body.dart';
import 'package:store/features/shop/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:store/generated/l10n.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: S.of(context).Explore,
        context: context,
        arrowBack: false,
      ),
      body: BlocProvider(
        create: (context) {
          final cubit = CategoriesCubit();
          cubit.getCategories();
          return cubit;
        },
        child: ExploreViewBody(),
      ),
    );
  }
}
