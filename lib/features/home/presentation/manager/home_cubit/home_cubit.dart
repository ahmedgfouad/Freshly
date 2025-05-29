import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/home/data/services/home_services.dart';
import 'package:store/features/home/presentation/manager/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(ShopInitial());
  final shopServices = HomeServicesImpl();
  Future<void> getShopProducts() async {
    emit(ShopLoading());
    try {
      final products = await shopServices.getProducts();
      emit(ShopSuccess(products));
    } catch (e) {
      emit(ShopFailed(e.toString()));
    }
  }

  Future<void> getCategories() async {
    emit(CatrgoriesLoading());
    try {
      final categories = await shopServices.getCategories();
      emit(CatrgoriesSuccess(categories));
    } catch (e) {
      emit(CatrgoriesFailed(e.toString()));
    }
  }
}
