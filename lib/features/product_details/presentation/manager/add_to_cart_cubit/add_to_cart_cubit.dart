import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/product_details/data/models/add_to_cart_model.dart';
import 'package:store/features/product_details/data/services/add_to_cart_services.dart';
import 'package:store/features/product_details/presentation/manager/add_to_cart_cubit/add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit() : super(AddToCartInitial());

  final addToCartServices = AddToCartServicesImpl();

  Future<void> addCartToFirestore(AddToCartModel product) async {
    emit(AddToCartLoadingState());
    try {
      await addToCartServices.addCartToFirestore(product);
      emit(AddToCartSuccessState());
    } catch (e) {
      emit(AddToCartFailedState(e.toString()));
    }
  }
}
