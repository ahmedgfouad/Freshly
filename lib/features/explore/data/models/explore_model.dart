

class ExploreModel {
  final String imageUrl; 
  final String name;

  ExploreModel({required this.imageUrl, required this.name}); 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageUrl': imageUrl,
      'name': name,
    };
  }

  factory ExploreModel.fromMap(Map<String, dynamic> map) {
    return ExploreModel(
      imageUrl: map['imageUrl'] as String,
      name: map['name'] as String,
    );
  }


}
