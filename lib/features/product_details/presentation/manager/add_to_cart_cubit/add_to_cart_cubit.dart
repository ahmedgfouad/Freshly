import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/home/data/models/save_product_model.dart';
import 'package:store/features/product_details/data/services/add_to_cart_services.dart';
import 'package:store/features/product_details/presentation/manager/add_to_cart_cubit/add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit(this.addToCartServices) : super(AddToCartInitial());

  final AddToCartServices addToCartServices ;

  double quantity = 1;
  void changeQuantity(double value) {
    emit(AddToCartInitial());
    quantity = value;
    emit(ChangeQuantitySuccessState());
  }

  Future<void> addCartToFirestore(SaveProductModel product) async {
    emit(AddToCartLoadingState());
    try {
      await addToCartServices.addCartToFirestore(product);
      emit(AddToCartSuccessState());
    } catch (e) {
      emit(AddToCartFailedState(e.toString()));
    }
  }
}
