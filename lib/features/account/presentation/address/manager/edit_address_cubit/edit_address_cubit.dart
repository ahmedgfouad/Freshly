import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/account/data/models/address_model.dart';
import 'package:store/features/account/data/services/address_services.dart';
import 'package:store/features/account/presentation/address/manager/edit_address_cubit/edit_address_state.dart';

class EditAddressCubit extends Cubit<EditAddressState> {
  EditAddressCubit() : super(EditAddressInitial());

  final addressServices = AddressServicesImpl();

  Future<void> editAddress(AddressModel address) async {
    emit(EditAddressLoadingState());
    try {
      addressServices.setNewAddress(address);
      emit(EditAddressSuccessState());
    } catch (e) {
      emit(EditAddressFailedState(e.toString()));
    }
  }
}
