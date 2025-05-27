sealed class AddToFavoriteState {}

final class AddToFavoriteInitial extends AddToFavoriteState {}

final class AddToFavoriteLoadingState extends AddToFavoriteState {}

final class AddToFavoriteSuccessState extends AddToFavoriteState {}

final class AddToFavoriteFailedState extends AddToFavoriteState {
  final String error;

  AddToFavoriteFailedState(this.error);
}


