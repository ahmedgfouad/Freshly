import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/cart/data/services/cart_services.dart';
import 'package:store/features/cart/presentation/manager/cart_cubit/cart_state.dart';

// class CartCubit extends Cubit<CartState> {
//   CartCubit() : super(CartInitial());

//   final cartService = CartServicesImpl();

//   Future<void> getMyProductCart() async{
//     emit(CartLoadingState());
//     try {
//      final myProductsCart= await cartService.getMyProductsCart();
//       emit(CartSuccsessState(myProductsCart));
//     } catch (e) {
//       emit(CartFailedState(e.toString()));
//     }
//   }
// }

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial()) {
    _startListeningToCart();
  }

  final cartService = CartServicesImpl();
  StreamSubscription? _cartSubscription;

  void _startListeningToCart() {
    emit(CartLoadingState());

    _cartSubscription = cartService.getMyProductsCart().listen((cartItems) {
      emit(CartSuccsessState(cartItems));
    }, onError: (e) {
      emit(CartFailedState(e.toString()));
    });
  }

  @override
  Future<void> close() {
    _cartSubscription?.cancel();
    return super.close();
  }
}
