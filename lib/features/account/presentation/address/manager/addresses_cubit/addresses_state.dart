import 'package:store/features/account/data/models/address_model.dart';

sealed class AddressesState {}

final class AddressesInitial extends AddressesState {}

final class AddressesLoadingState extends AddressesState {}

final class AddressesSuccessState extends AddressesState {
  final List<AddressModel> addresses;

  AddressesSuccessState(this.addresses);
}

final class AddressesFailedState extends AddressesState {
  final String error;

  AddressesFailedState(this.error);
}

final class LoadingDeleteAddressState extends AddressesState {}

final class SuccsessDeleteAddressState extends AddressesState {}

final class FailedDeleteAddressState extends AddressesState {
  final String error;

  FailedDeleteAddressState(this.error);
}
