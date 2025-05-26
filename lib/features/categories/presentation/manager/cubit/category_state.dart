import 'package:store/features/home/data/models/product_model.dart';

sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final List<ProductModel> products;

  CategorySuccess(this.products);
}

final class CategoryFailed extends CategoryState {
  final String error;

  CategoryFailed(this.error);
}
