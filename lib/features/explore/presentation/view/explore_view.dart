import 'package:flutter/material.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/explore/presentation/view/widget/explore_view_body.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Explore",
        context: context,
        arrowBack: false,
      ),
      body: ExploreViewBody(),
    );

  }
}
