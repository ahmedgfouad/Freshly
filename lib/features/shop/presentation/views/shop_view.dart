import 'package:flutter/material.dart';
import 'package:store/features/shop/presentation/views/widgets/shop_view_body_widget.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ShopViewBodyWidget());
  }
}
