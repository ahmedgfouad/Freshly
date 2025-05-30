import 'package:store/features/home/data/models/category_model.dart';
import 'package:store/features/home/data/models/product_model.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class BottomNavState extends HomeState {}



final class ShopLoading extends HomeState {}

final class ShopSuccess extends HomeState {
  final List<ProductModel> products;
  ShopSuccess(this.products);
}

final class ShopFailed extends HomeState {
  final String error;

  ShopFailed(this.error);
}

final class CatrgoriesLoading extends HomeState {}

final class CatrgoriesSuccess extends HomeState {
  final List<CateroryModel> catrgories;

  CatrgoriesSuccess(this.catrgories);
}

final class CatrgoriesFailed extends HomeState {
  final String error;

  CatrgoriesFailed(this.error);
}
