import 'package:store/core/services/firestore_services.dart';
import 'package:store/core/utils/api_path.dart';
import 'package:store/features/account/data/models/address_model.dart';
import 'package:store/features/registeration/data/services/auth_services.dart';

abstract class AddressServices {
  Future<void> addNewAddress(AddressModel address);
}

class AddressServicesImpl implements AddressServices {
  final firestoreservices = FirestoreServices.instance;
  final uid = AuthServicesImpl().currentUser!.uid;

  @override
  Future<void> addNewAddress(AddressModel address) async =>
      await firestoreservices.setData(
        path: ApiPath.addresses(uid, address.id),
        data: address.toMap(),
      );
}
