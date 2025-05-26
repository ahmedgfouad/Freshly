import 'package:store/core/services/firestore_services.dart';
import 'package:store/core/utils/api_path.dart';
import 'package:store/features/product_details/data/models/add_to_cart_model.dart';
import 'package:store/features/registeration/data/services/auth_services.dart';

abstract class AddToCartServices {
  Future<void> addCartToFirestore(AddToCartModel product);
}

class AddToCartServicesImpl implements AddToCartServices {
  final firestoreSercises = FirestoreServices.instance;

  @override
  Future<void> addCartToFirestore(AddToCartModel product) async {
    final uid = AuthServicesImpl().currentUser!.uid;
    await firestoreSercises.setData(
      path: ApiPath.addToCart(uid, product.id),
      data: product.toMap(),
    );
  }
}
