
sealed class AddToCartState {}

final class AddToCartInitial extends AddToCartState {}

final class AddToCartLoadingState extends AddToCartState {}

final class AddToCartSuccessState extends AddToCartState {}

final class AddToCartFailedState extends AddToCartState {
  final String error;

  AddToCartFailedState(this.error); 

}

final class ChangeQuantitySuccessState extends AddToCartState {}
