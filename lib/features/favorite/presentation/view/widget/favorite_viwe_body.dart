import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/utils/images.dart';
import 'package:store/core/widgets/custom_emty_page_widget.dart';
import 'package:store/core/widgets/custom_loading_indecator.dart';
import 'package:store/features/favorite/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:store/features/favorite/presentation/manager/favorite_cubit/favorite_state.dart';
import 'package:store/features/favorite/presentation/view/widget/list_of_favorite_items_widget.dart';

class FavoriteViweBody extends StatelessWidget {
  const FavoriteViweBody({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteCubit = BlocProvider.of<FavoriteCubit>(context);
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      bloc: favoriteCubit,
      buildWhen:
          (previous, current) =>
              current is DeleteFromFavoriteSuccessState ||
              current is FavoriteInitial ||
              current is FavoriteLoadingState ||
              current is FavoriteSuccessState ||
              current is FavoriteFailedState,
      builder: (context, state) {
        if (state is FavoriteLoadingState) {
          return CustomLoadingIndecator();
        } else if (state is FavoriteFailedState) {
          return Text(state.error);
        } else if (state is FavoriteSuccessState) {
          final items = state.favoritItems;
          return items.isNotEmpty
              ? ListOfFavoriteItemsWidget(items: items)
              : CustomEmptyPage(
                image: AppImages.favoriteEmptyImg,
                title: 'Your heart is empty',
                subTitle: 'Start fall in love with some good goods ',
              );
        } else {
          return Text("error");
        }
      },
    );
  }
}
