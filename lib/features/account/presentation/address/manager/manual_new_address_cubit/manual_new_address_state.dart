sealed class ManualNewAddressState {}

final class ManualNewAddressInitial extends ManualNewAddressState {}

final class ManualNewAddressLoadingState extends ManualNewAddressState {}

final class ManualNewAddressSuccessState extends ManualNewAddressState {}

final class ManualNewAddressFailedState extends ManualNewAddressState {
  final String error;

  ManualNewAddressFailedState(this.error);
}
