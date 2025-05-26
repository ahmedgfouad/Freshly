import 'package:flutter/material.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/account/presentation/order/widgets/order_view_bodey.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Order", context: context),
      body: OrderViewBodey(),
    );
  }
}
