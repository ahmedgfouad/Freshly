
import 'package:store/features/home/data/models/category_model.dart';

sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CatrgoriesLoading extends CategoriesState {}

final class CatrgoriesSuccess extends CategoriesState {
  final List<CateroryModel> catrgories;

  CatrgoriesSuccess(this.catrgories);
}

final class CatrgoriesFailed extends CategoriesState {
  final String error;

  CatrgoriesFailed(this.error);
}