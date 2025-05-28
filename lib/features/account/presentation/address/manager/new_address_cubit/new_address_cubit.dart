import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/account/data/models/address_model.dart';
import 'package:store/features/account/data/services/address_services.dart';
import 'package:store/features/account/presentation/address/manager/new_address_cubit/new_address_state.dart';

class NewAddressCubit extends Cubit<NewAddressState> {
  NewAddressCubit() : super(NewAddressInitial());

  final newAddressServices = AddressServicesImpl();

  Future<void> addNewAddress(AddressModel address) async {
    emit(NewAddressLoadingState());
    try {
      await newAddressServices.setNewAddress(address);
      emit(NewAddressSuccessState());
    } catch (e) {
      emit(NewAddressFailedState(e.toString()));
    }
  }
}
