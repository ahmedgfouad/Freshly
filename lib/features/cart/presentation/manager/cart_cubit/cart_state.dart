import 'package:store/features/product_details/data/models/add_to_cart_model.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoadingState extends CartState {}

final class CartSuccsessState extends CartState {
  final  List<AddToCartModel> myProductsCart;

  CartSuccsessState(this.myProductsCart);
}

final class CartFailedState extends CartState {
  final String error;

  CartFailedState(this.error);
}
