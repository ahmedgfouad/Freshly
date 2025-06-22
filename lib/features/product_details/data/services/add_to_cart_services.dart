import 'package:store/core/services/firestore_services.dart';
import 'package:store/core/services/firebase_path.dart';
import 'package:store/features/home/data/models/save_product_model.dart';
import 'package:store/features/registeration/data/services/auth_services.dart';

abstract class AddToCartServices {
  Future<void> addCartToFirestore(SaveProductModel product);
}

class AddToCartServicesImpl implements AddToCartServices {
  final firestoreSercises = FirestoreServices.instance;

  @override
  Future<void> addCartToFirestore(SaveProductModel product) async {
    final uid = AuthServicesImpl().currentUser!.uid;
    await firestoreSercises.setData(
      path: FirestorePath.carts(uid, product.id),
      data: product.toMap(),
    );
  }
}
