import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/shop/data/services/shop_services.dart';
import 'package:store/features/shop/presentation/manager/cubit/shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());

  Future<void> getShopProducts() async {
    final shopServices = ShopServicesImpl();
    emit(ShopLoading());
    try {
      final products = await shopServices.getProducts();
      // print('object');
      emit(ShopSuccess(products));
    } catch (e) {
      emit(ShopFailed(e.toString()));
    }
  }
}
