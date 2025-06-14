import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/favorite/data/services/favorite_services.dart';
import 'package:store/features/favorite/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:store/features/favorite/presentation/view/widget/favorite_viwe_body.dart';
import 'package:store/features/home/presentation/view/widgets/animation_tab_view.dart';
import 'package:store/generated/l10n.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedTabView(
      tabIndex: 3,
      child: Scaffold(
        appBar: customAppBar(
          title: S.of(context).Favorite,
          context: context,
          arrowBack: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: BlocProvider(
            create: (context) => FavoriteCubit(FavoriteServicesImpl()),
            child: FavoriteViweBody(),
          ),
        ),
      ),
    );
  }
}
