import 'package:flutter/material.dart';
import 'package:store/core/utils/images.dart';
import 'package:store/features/account/presentation/order/widgets/date_order_widget.dart';
import 'package:store/features/account/presentation/order/widgets/time_line_tile_widget.dart';

class OrderStatusTimeline extends StatelessWidget {
  const OrderStatusTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          DateOrderWidget(),

          TimelineTileWidget(
            isFirst: true,
            image: AppImages.order1Img,
            title: 'We are packin your items...',
          ),

          TimelineTileWidget(
            isFirst: false,
            image: AppImages.order2Img,
            title: "Your order is delivering to your location...",
          ),
          TimelineTileWidget(
            isFirst: false,
            image: AppImages.order3Img,
            title: "Your order is received.",
            isLast: true,
            isCheck: false,
          ),
        ],
      ),
    );
  }
}
