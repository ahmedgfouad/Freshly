import 'package:store/core/services/firestore_services.dart';
import 'package:store/core/utils/api_path.dart';
import 'package:store/features/product_details/data/models/add_to_cart_model.dart';
import 'package:store/features/registeration/data/services/auth_services.dart';

abstract class CartServices {
  Stream<List<AddToCartModel>> getMyProductsCart();
}

class CartServicesImpl implements CartServices {
  final firestoservice = FirestoreServices.instance;

  @override
  Stream<List<AddToCartModel>> getMyProductsCart() {
    final uid = AuthServicesImpl().currentUser!.uid;
    return firestoservice.collectionsStram(
      path: ApiPath.myProductsCart(uid),
      builder: (data, documentId) => AddToCartModel.fromMap(data!, documentId),
    );
  }
}
