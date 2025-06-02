
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:store/features/home/data/models/category_model.dart';
import 'package:store/features/home/data/services/home_services.dart';
import 'package:store/features/shop/presentation/manager/categories_cubit/categories_state.dart';


class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
 final shopServices = HomeServicesImpl();
  final box = Hive.box('shopBox'); 

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

