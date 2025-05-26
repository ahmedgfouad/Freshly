import 'package:flutter/widgets.dart';
import 'package:store/core/utils/images.dart';
import 'package:store/core/widgets/custom_buton.dart';
import 'package:store/core/widgets/custom_emty_page_widget.dart';
import 'package:store/features/cart/presentation/widget/cart_item_widget.dart';
import 'package:store/features/cart/presentation/widget/list_of_cart_items_widget.dart';

class CartViewBody extends StatelessWidget {
  CartViewBody({super.key});

  final List items = [
    CartItemWidget(),
    CartItemWidget(),
    CartItemWidget(),
    CartItemWidget(),
    CartItemWidget(),
    CartItemWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return items.isNotEmpty
        ? CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: ListOfCartItemsWidget(items: items)),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                child: CustomButon(text: "Check Out", onPressed: () {}),
              ),
            ),
          ],
        )
        : CustomEmptyPage(
          image: AppImages.welcomImg,
          title: "Your Cart is empty",
          subTitle: "Start filling your shopping cart",
        );
  }
}
