import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/favorite/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:store/features/favorite/presentation/view/widget/favorite_viwe_body.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Favorite",
        context: context,
        arrowBack: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: BlocProvider(
          create: (context) => FavoriteCubit(),
          child: FavoriteViweBody(),
        ),
      ),
    );
  }
}
