import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:store/core/utils/constants.dart';
import 'package:store/features/home/data/models/category_model.dart';
import 'package:store/features/home/data/services/home_services.dart';
import 'package:store/features/shop/presentation/manager/categories_cubit/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.shopServices) : super(CategoriesInitial());
  final HomeServices shopServices ;
  final box = Hive.box(hiveName);

  Future<void> getCategories() async {
    emit(CatrgoriesLoading());
    try {
      final cachedData = box.get(hiveCategoriesName);
      if (cachedData != null) {
        final cachedCategories =
            (cachedData as List).map((item) {
              final map = Map<String, dynamic>.from(item);
              return CateroryModel.fromMap(map);
            }).toList();

        emit(CatrgoriesSuccess(cachedCategories));
      }

      final categories = await shopServices.getCategories();

      await box.put(hiveCategoriesName, categories.map((e) => e.toMap()).toList());

      emit(CatrgoriesSuccess(categories));
    } catch (e) {
      final cachedData = box.get(hiveCategoriesName);
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
