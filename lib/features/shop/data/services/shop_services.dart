import 'package:store/core/services/firestore_services.dart';
import 'package:store/core/utils/api_path.dart';
import 'package:store/features/home/data/models/product_model.dart';

abstract class ShopServices {
  Future<List<ProductModel>> getProducts();
}

class ShopServicesImpl implements ShopServices {
  final firestor = FirestoreServices.instance;
  @override
  Future<List<ProductModel>> getProducts() async=>await
    firestor.getCollection(
      path: ApiPath.products(),
      builder: (data, documentId) => ProductModel.fromMap(data, documentId),
    );
  
}
