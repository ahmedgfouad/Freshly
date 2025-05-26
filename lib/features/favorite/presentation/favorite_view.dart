import 'package:flutter/material.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/favorite/presentation/widget/favorite_viwe_body.dart';

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
        child: FavoriteViweBody(),
      ),
    );
  }
}
