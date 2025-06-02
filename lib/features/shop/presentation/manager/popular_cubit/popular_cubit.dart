
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:store/features/home/data/models/product_model.dart';
import 'package:store/features/home/data/services/home_services.dart';
import 'package:store/features/shop/presentation/manager/popular_cubit/popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit() : super(PopularInitial());
  final shopServices = HomeServicesImpl();
    final box = Hive.box('shopBox');



   Future<void> getShopProducts() async {
    emit(PopularLoadingState());
    try {
      final cachedData = box.get('products');
      if (cachedData != null) {
        final cachedProducts =
            (cachedData as List).map((item) {
              final map = Map<String, dynamic>.from(item);
              return ProductModel.fromMap(map, map['id']);
            }).toList();

        emit(PopularSuccessState(cachedProducts));
      }

      final products = await shopServices.getProducts();
      await box.put('products', products.map((e) => e.toMap()).toList());
      emit(PopularSuccessState(products));
    } catch (e) {
      final cachedData = box.get('products');
      if (cachedData != null) {
        final cachedProducts =
            (cachedData as List).map((item) {
              final map = Map<String, dynamic>.from(item);
              return ProductModel.fromMap(map, map['id']);
            }).toList();

        emit(PopularSuccessState(cachedProducts));
      } else {
        emit(PopularFailedState(e.toString()));
      }
    }
  }

 
}
