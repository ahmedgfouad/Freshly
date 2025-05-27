import 'package:store/features/home/data/models/save_product_model.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoadingState extends CartState {}

final class CartSuccsessState extends CartState {
  final List<SaveProductModel> myProductsCart;

  CartSuccsessState(this.myProductsCart);
}

final class CartFailedState extends CartState {
  final String error;

  CartFailedState(this.error);
}

final class DeleteCartLoadingState extends CartState {}

final class DeleteCartSuccessState extends CartState {}

final class DeleteCartFailedState extends CartState {
  final String error;

  DeleteCartFailedState(this.error); 
}
