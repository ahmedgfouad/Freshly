import 'package:store/core/services/firestore_services.dart';
import 'package:store/core/services/firebase_path.dart';
import 'package:store/features/home/data/models/save_product_model.dart';
import 'package:store/features/registeration/data/services/auth_services.dart';

abstract class CartServices {
  Stream<List<SaveProductModel>> getMyProductsCart();
  Future<void> deleteMyProductCart(SaveProductModel product);
}

class CartServicesImpl implements CartServices {
  final firestoservice = FirestoreServices.instance;
  final uid = AuthServicesImpl().currentUser!.uid;

  @override
  Stream<List<SaveProductModel>> getMyProductsCart() =>
      firestoservice.collectionsStram(
        path: FirestorePath.myProductsCart(uid),
        builder:
            (data, documentId) => SaveProductModel.fromMap(data!, documentId),
      );

  @override
  Future<void> deleteMyProductCart(SaveProductModel product) async =>
      await firestoservice.deleteData(
        path: FirestorePath.carts(uid, product.id),
      );
}
