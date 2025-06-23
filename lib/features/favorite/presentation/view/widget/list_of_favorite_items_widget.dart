import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/theme/colors.dart';
import 'package:store/core/widgets/custom_loading_indecator.dart';
import 'package:store/features/cart/presentation/view/widget/cart_item_widget.dart';
import 'package:store/features/favorite/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:store/features/favorite/presentation/manager/favorite_cubit/favorite_state.dart';
import 'package:store/features/home/data/models/save_product_model.dart';

class ListOfFavoriteItemsWidget extends StatelessWidget {
  const ListOfFavoriteItemsWidget({super.key, required this.items});

  final List<SaveProductModel> items;

  @override
  Widget build(BuildContext context) {
    final deleteCubit = BlocProvider.of<FavoriteCubit>(context);
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      bloc: deleteCubit,
      buildWhen:
          (previous, current) =>
              current is DeleteFromFavoriteFailedState ||
              current is DeleteFromFavoriteLoadingState ||
              current is DeleteFromFavoriteSuccessState,
      builder: (context, state) {
        if (state is DeleteFromFavoriteLoadingState) {
          return CustomLoadingIndecator();
        } else if (state is DeleteFromFavoriteFailedState) {
          return Text("error");
        } else if (state is DeleteFromFavoriteSuccessState ||
            state is FavoriteSuccessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.separated(
              itemBuilder:
                  (context, index) => Dismissible(
                    onDismissed: (direction) {
                      deleteCubit.deleteFromFavorite(items[index]);
                    },
                    key: ValueKey(items[index]),
                    background: Container(
                      decoration: BoxDecoration(
                        color: context.appColors.browen,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(
                        Icons.delete_outline,
                        color: context.appColors.white,
                      ),
                    ),
                    child: CartItemWidget(product: items[index]),
                  ),
              separatorBuilder: (context, index) => SizedBox(height: 20.h),
              itemCount: items.length,
            ),
          );
        } else {
          return Text("data");
        }
      },
    );
  }
}
