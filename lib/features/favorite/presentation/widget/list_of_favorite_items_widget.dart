
import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/favorite/presentation/widget/favorite_item_widget.dart';

class ListOfFavoriteItemsWidget extends StatelessWidget {
  const ListOfFavoriteItemsWidget({
    super.key,
    required this.items,
  });

  final List items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.separated(
        itemBuilder:
            (context, index) => Dismissible(
              key: ValueKey(items[index]),
              background: Container(
                decoration: BoxDecoration(
                  color: AppColors().browen,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.delete_outline, color: AppColors().white),
              ),
              child: FavoriteItemWidget(),
            ),
        separatorBuilder: (context, index) => SizedBox(height: 5),
        itemCount: items.length,
      ),
    );
  }
}
