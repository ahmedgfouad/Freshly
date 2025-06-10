import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/account/data/models/address_model.dart';
import 'package:store/features/account/data/services/address_services.dart';
import 'package:store/features/account/presentation/address/manager/manual_new_address_cubit/manual_new_address_state.dart';

class ManualNewAddressCubit extends Cubit<ManualNewAddressState> {
  ManualNewAddressCubit(this.newAddressServices) : super(ManualNewAddressInitial());

  final AddressServices newAddressServices;

  Future<void> addNewAddress(AddressModel address) async {
    emit(ManualNewAddressLoadingState());
    try {
      await newAddressServices.setNewAddress(address);
      emit(ManualNewAddressSuccessState());
    } catch (e) {
      emit(ManualNewAddressFailedState(e.toString()));
    }
  }
}
