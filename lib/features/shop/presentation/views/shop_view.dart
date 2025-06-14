import 'package:flutter/material.dart';
import 'package:store/features/home/presentation/view/widgets/animation_tab_view.dart';
import 'package:store/features/shop/presentation/views/widgets/shop_view_body_widget.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedTabView(
      tabIndex: 0,
      child: Scaffold(body: ShopViewBodyWidget()),
    );
  }
}
