
sealed class NewAddressState {}

final class NewAddressInitial extends NewAddressState {}

final class NewAddressLoadingState extends NewAddressState {}

final class NewAddressSuccessState extends NewAddressState {}

final class NewAddressFailedState extends NewAddressState {
  final String error;

  NewAddressFailedState(this.error);
}
