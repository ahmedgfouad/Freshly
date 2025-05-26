import 'package:flutter/material.dart';
import 'package:store/features/account/presentation/order/widgets/item_order_history_widget.dart';

class ListOfItemOrdersHistoryWidget extends StatelessWidget {
  const ListOfItemOrdersHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => ItemOrderHistoryWidget(),
      separatorBuilder: (context, index) => SizedBox(height: 5),
      itemCount: 6,
    );
  }
}