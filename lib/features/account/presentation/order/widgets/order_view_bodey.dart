import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/utils/images.dart';
import 'package:store/core/widgets/custom_emty_page_widget.dart';
import 'package:store/core/widgets/custom_tab_bar_view_widget.dart';
import 'package:store/core/widgets/custom_tab_bar_widget.dart';
import 'package:store/features/account/presentation/order/widgets/list_of_item_order_history_widget.dart';
import 'package:store/features/account/presentation/order/widgets/order_status_time_line_widget.dart';

class OrderViewBodey extends StatelessWidget {
  OrderViewBodey({super.key});

  final List<Widget> tabs = [
    Container(
      width: 100.w,
      alignment: Alignment.centerLeft,
      child: const Tab(text: "Ongoing"),
    ),
    Container(
      width: 100.w,
      alignment: Alignment.centerRight,
      child: const Tab(text: "History"),
    ),
  ];
  final isOrderNotEmpty = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            CustomTabBarWidget(tabs: tabs),
           const  SizedBox(height: 20),
            CustomTabBarViewWiget(
              tabBarViewlist: [
                isOrderNotEmpty
                    ? OrderStatusTimeline()
                    : CustomEmptyPage(
                      image: AppImages.orderEmptyImg,
                      title:
                          "There is n ongoing order right now. You can order from home",
                      subTitle: "",
                    ),
                ListOfItemOrdersHistoryWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
