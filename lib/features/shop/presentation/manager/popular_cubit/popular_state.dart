import 'package:store/features/home/data/models/product_model.dart';

sealed class PopularState {}

final class PopularInitial extends PopularState {}

final class PopularLoadingState extends PopularState {}
final class PopularSuccessState extends PopularState {
    final List<ProductModel> products;

  PopularSuccessState(this.products);

}
final class PopularFailedState extends PopularState {
   final String error;

  PopularFailedState(this.error);
}
