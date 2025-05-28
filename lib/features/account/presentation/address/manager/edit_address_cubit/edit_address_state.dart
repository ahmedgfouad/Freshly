sealed class EditAddressState {}

final class EditAddressInitial extends EditAddressState {}

final class EditAddressLoadingState extends EditAddressState {}

final class EditAddressSuccessState extends EditAddressState {}

final class EditAddressFailedState extends EditAddressState {
  final String error;

  EditAddressFailedState(this.error);
}
