import 'package:store/features/home/data/models/save_product_model.dart';

sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoadingState extends FavoriteState {}

final class FavoriteSuccessState extends FavoriteState {
  final List<SaveProductModel> favoritItems;

  FavoriteSuccessState(this.favoritItems); 
}

final class FavoriteFailedState extends FavoriteState {
  final String error;

  FavoriteFailedState(this.error);
}

final class DeleteFromFavoriteLoadingState extends FavoriteState {

  DeleteFromFavoriteLoadingState();
}

final class DeleteFromFavoriteSuccessState extends FavoriteState {}

final class DeleteFromFavoriteFailedState extends FavoriteState {
  final String error;

  DeleteFromFavoriteFailedState(this.error);
}