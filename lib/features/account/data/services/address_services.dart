import 'package:store/core/services/firestore_services.dart';
import 'package:store/core/utils/api_path.dart';
import 'package:store/features/account/data/models/address_model.dart';
import 'package:store/features/registeration/data/services/auth_services.dart';

abstract class AddressServices {
  Future<void> setNewAddress(AddressModel address);
  Stream<List<AddressModel>> getAddresses();

  Future<void> deleteAddress(AddressModel address);
}

class AddressServicesImpl implements AddressServices {
  final firestoreservices = FirestoreServices.instance;
  final uid = AuthServicesImpl().currentUser!.uid;

  @override
  Future<void> setNewAddress(AddressModel address) async {
    await firestoreservices.setData(
      path: ApiPath.addresses(uid, address.id),
      data: address.toMap(),
    );
  }

  @override
  Stream<List<AddressModel>> getAddresses() =>
      firestoreservices.collectionsStram(
        path: ApiPath.myAddresses(uid),
        builder: (data, documentId) => AddressModel.fromMap(data!, documentId),
      );

  @override
  Future<void> deleteAddress(AddressModel address) async =>
      await firestoreservices.deleteData(
        path: ApiPath.addresses(uid, address.id),
      );
}
