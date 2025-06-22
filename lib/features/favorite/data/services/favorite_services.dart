import 'package:store/core/services/firestore_services.dart';
import 'package:store/core/services/firebase_path.dart';
import 'package:store/features/home/data/models/save_product_model.dart';
import 'package:store/features/registeration/data/services/auth_services.dart';

abstract class FavoriteServices {
  Stream<List<SaveProductModel>> getFavoriteItem();
  Future<void> deleteProductFromFavorite(SaveProductModel product);
}

class FavoriteServicesImpl implements FavoriteServices {
  final uid = AuthServicesImpl().currentUser!.uid;
  final firestoreServices = FirestoreServices.instance;

  @override
  Stream<List<SaveProductModel>> getFavoriteItem() =>
      firestoreServices.collectionsStram(
        path: FirestorePath.myProductsFavorite(uid),
        builder:
            (data, documentId) => SaveProductModel.fromMap(data!, documentId),
      );

  @override
  Future<void> deleteProductFromFavorite(SaveProductModel product) async =>
      await firestoreServices.deleteData(
        path: FirestorePath.favorites(uid, product.id),
      );
}
