import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/categories/data/services/category_services.dart';
import 'package:store/features/categories/presentation/manager/cubit/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  final categoryService = CategoryServicesImpl();
  Future<void> getCategoryProducts({required String categoryName}) async {
    emit(CategoryLoading());
    try {
      final products = await categoryService.getproducts(categoryName);
      emit(CategorySuccess(products));
    } catch (e) {
      emit(CategoryFailed(e.toString()));
    }
  }
}
