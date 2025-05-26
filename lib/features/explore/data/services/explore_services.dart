import 'package:store/core/services/firestore_services.dart';
import 'package:store/core/utils/api_path.dart';
import 'package:store/features/explore/data/models/explore_model.dart';

abstract class ExploreServices {
  Future<List<ExploreModel>> getExploreImages();
}

class ExploreServicesImpl implements ExploreServices {
  final firestorService = FirestoreServices.instance;
  @override
  Future<List<ExploreModel>> getExploreImages() async =>
      await firestorService.getCollection(
        path: ApiPath.categories(),
        builder: (data, documentId) => ExploreModel.fromMap(data),
      );
}
