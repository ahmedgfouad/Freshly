import 'package:store/core/services/firestore_services.dart';
import 'package:store/core/services/firebase_path.dart';
import 'package:store/features/home/data/models/save_product_model.dart';
import 'package:store/features/registeration/data/services/auth_services.dart';

abstract class AddToFavoriteServices {
  Future<void> addProductToFavorite(SaveProductModel product);
}

class AddToFavoriteServicesImpl implements AddToFavoriteServices {
  final firestoreServices = FirestoreServices.instance;
  final uid = AuthServicesImpl().currentUser!.uid;

  @override
  Future<void> addProductToFavorite(SaveProductModel product) async {
    await firestoreServices.setData(
      path: FirestorePath.favorites(uid, product.id),
      data: product.toMap(),
    );
  }
}
