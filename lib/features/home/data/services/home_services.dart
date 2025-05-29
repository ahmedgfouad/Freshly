import 'package:store/core/services/firestore_services.dart';
import 'package:store/core/utils/api_path.dart';
import 'package:store/features/home/data/models/category_model.dart';
import 'package:store/features/home/data/models/product_model.dart';

abstract class HomeServices {
  Future<List<ProductModel>> getProducts();
  Future<List<CateroryModel>> getCategories();
}

class HomeServicesImpl implements HomeServices {
  final firestorService = FirestoreServices.instance;
  @override
  Future<List<ProductModel>> getProducts() async =>
      await firestorService.getCollection(
        path: ApiPath.products(),
        builder: (data, documentId) => ProductModel.fromMap(data, documentId),
      );

  @override
  Future<List<CateroryModel>> getCategories() async =>
      await firestorService.getCollection(
        path: ApiPath.categories(),
        builder: (data, documentId) => CateroryModel.fromMap(data),
      );
}
