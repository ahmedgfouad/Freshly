import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/products/data/services/category_services.dart';
import 'package:store/features/products/presentation/manager/cubit/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.categoryService) : super(CategoryInitial());
  final CategoryServices categoryService ;
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
