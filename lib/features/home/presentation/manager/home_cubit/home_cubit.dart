import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:store/features/home/data/models/category_model.dart';
import 'package:store/features/home/data/models/product_model.dart';
import 'package:store/features/home/data/services/home_services.dart';
import 'package:store/features/home/presentation/manager/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final shopServices = HomeServicesImpl();
  int currentIndex = 0;
  final box = Hive.box('shopBox');

  void changeIndex(int index) {
    currentIndex = index;
    emit(BottomNavState());
  }

  Future<void> getShopProducts() async {
    emit(ShopLoading());
    try {
      final cachedData = box.get('products');
      if (cachedData != null) {
        final cachedProducts =
            (cachedData as List).map((item) {
              final map = Map<String, dynamic>.from(item);
              return ProductModel.fromMap(map, map['id']);
            }).toList();

        emit(ShopSuccess(cachedProducts));
      }

      final products = await shopServices.getProducts();
      await box.put('products', products.map((e) => e.toMap()).toList());
      emit(ShopSuccess(products));
    } catch (e) {
      final cachedData = box.get('products');
      if (cachedData != null) {
        final cachedProducts =
            (cachedData as List).map((item) {
              final map = Map<String, dynamic>.from(item);
              return ProductModel.fromMap(map, map['id']);
            }).toList();

        emit(ShopSuccess(cachedProducts));
      } else {
        emit(ShopFailed(e.toString()));
      }
    }
  }

  Future<void> getCategories() async {
    emit(CatrgoriesLoading());
    try {
      final cachedData = box.get('categories');
      if (cachedData != null) {
        final cachedCategories =
            (cachedData as List).map((item) {
              final map = Map<String, dynamic>.from(item);
              return CateroryModel.fromMap(map);
            }).toList();

        emit(CatrgoriesSuccess(cachedCategories));
      }

      final categories = await shopServices.getCategories();

      await box.put('categories', categories.map((e) => e.toMap()).toList());

      emit(CatrgoriesSuccess(categories));
    } catch (e) {
      final cachedData = box.get('categories');
      if (cachedData != null) {
        final cachedCategories =
            (cachedData as List)
                .map((item) => CateroryModel.fromMap(item))
                .toList();
        emit(CatrgoriesSuccess(cachedCategories));
      } else {
        emit(CatrgoriesFailed(e.toString()));
      }
    }
  }
}
