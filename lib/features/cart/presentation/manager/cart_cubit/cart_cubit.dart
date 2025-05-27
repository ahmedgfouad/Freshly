import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/cart/data/services/cart_services.dart';
import 'package:store/features/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:store/features/home/data/models/save_product_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial()) {
    _startListeningToCart();
  }

  final cartService = CartServicesImpl();
  StreamSubscription? _cartSubscription;

  void _startListeningToCart() {
    emit(CartLoadingState());

    _cartSubscription = cartService.getMyProductsCart().listen(
      (cartItems) {
        emit(CartSuccsessState(cartItems));
      },
      onError: (e) {
        emit(CartFailedState(e.toString()));
      },
    );
  }

  @override
  Future<void> close() {
    _cartSubscription?.cancel();
    return super.close();
  }

  Future<void> deleteCart(SaveProductModel product) async {
    emit(DeleteCartLoadingState());
    try {
      cartService.deleteMyProductCart(product);
      emit(DeleteCartSuccessState());
    } catch (e) {
      emit(DeleteCartFailedState(e.toString()));
    }
  }
}
