import 'package:flutter/material.dart';
import 'package:store/core/utils/images.dart';
import 'package:store/core/widgets/custom_emty_page_widget.dart';
// ignore: unused_import
import 'package:store/features/favorite/presentation/widget/favorite_item_widget.dart';
import 'package:store/features/favorite/presentation/widget/list_of_favorite_items_widget.dart';

class FavoriteViweBody extends StatelessWidget {
  FavoriteViweBody({super.key,  });

  final List items = [
    // FavoriteItemWidget(),
    // FavoriteItemWidget(),
    // FavoriteItemWidget(),
    // FavoriteItemWidget(),
    // FavoriteItemWidget(),
    // FavoriteItemWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return items.isNotEmpty
        ? ListOfFavoriteItemsWidget(items: items)
        : CustomEmptyPage(
          image: AppImages.favoriteEmptyImg,
          title: 'Your heart is empty',
          subTitle: 'Start fall in love with some good goods ',
        );
  }
}
