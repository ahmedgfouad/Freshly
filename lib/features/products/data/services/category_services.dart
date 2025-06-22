import 'package:store/core/services/firestore_services.dart';
import 'package:store/core/services/firebase_path.dart';
import 'package:store/features/home/data/models/product_model.dart';

abstract class CategoryServices {
  Future<List<ProductModel>> getproducts(String categoryName);
}

class CategoryServicesImpl implements CategoryServices {
  final firestor = FirestoreServices.instance;

  @override
  Future<List<ProductModel>> getproducts(String categoryName) async =>
      await firestor.getCollection(
        path: FirestorePath.products(),
        builder: (data, documentId) => ProductModel.fromMap(data, documentId),
        queryBuilder:
            (query) => query.where("category", isEqualTo: categoryName),
      );
}
