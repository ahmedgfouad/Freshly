import 'package:store/features/home/data/models/product_model.dart';

sealed class ProductsState {}

final class CategoryInitial extends ProductsState {}

final class CategoryLoading extends ProductsState {}

final class CategorySuccess extends ProductsState {
  final List<ProductModel> products;

  CategorySuccess(this.products);
}

final class CategoryFailed extends ProductsState {
  final String error;

  CategoryFailed(this.error);
}
