import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/account/data/models/address_model.dart';
import 'package:store/features/account/data/services/address_services.dart';
import 'package:store/features/account/presentation/address/manager/addresses_cubit/addresses_state.dart';

class AddressesCubit extends Cubit<AddressesState> {
  AddressesCubit() : super(AddressesInitial()) {
    getAddresses();
  }
  final addressServices = AddressServicesImpl();
  StreamSubscription? addressesSubscription;

  void getAddresses() {
    addressesSubscription = addressServices.getAddresses().listen(
      (addressItem) {
        emit(AddressesSuccessState(addressItem));
      },
      onError: (e) {
        emit(AddressesFailedState(e.toString()));
      },
    );
  }

  @override
  Future<void> close() {
    addressesSubscription?.cancel();
    return super.close();
  }

  Future<void> deleteAddress(AddressModel address) async {
    emit(LoadingDeleteAddressState());
    try {
      await addressServices.deleteAddress(address);
      emit(SuccsessDeleteAddressState());
    } catch (e) {
      emit(FailedDeleteAddressState(e.toString()));
    }
  }
}
