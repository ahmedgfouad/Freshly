import 'package:store/features/home/data/models/product_model.dart';

sealed class ShopState {}

final class ShopInitial extends ShopState {}

final class ShopLoading extends ShopState {}

final class ShopSuccess extends ShopState {
  final List<ProductModel> products; 
  ShopSuccess(this.products);
}

final class ShopFailed extends ShopState {
  final String error;

  ShopFailed(this.error);
}
