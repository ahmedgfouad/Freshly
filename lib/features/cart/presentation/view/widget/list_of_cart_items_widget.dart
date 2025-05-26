import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/cart/presentation/view/widget/cart_item_widget.dart';

class ListOfCartItemsWidget extends StatelessWidget {
  const ListOfCartItemsWidget({super.key, required this.listOfCartProducts});
  final List listOfCartProducts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.5,
      child: ListView.separated(
        itemBuilder:
            (context, index) => Dismissible(
              key: ValueKey(listOfCartProducts[index]),
              background: Container(
                decoration: BoxDecoration(
                  color: AppColors().browen,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.delete_outline, color: AppColors().white),
              ),
              child: CartItemWidget(cartProduct: listOfCartProducts[index]),
            ),
        separatorBuilder: (context, index) => SizedBox(height: 5),
        itemCount: listOfCartProducts.length,
      ),
    );
  }
}
