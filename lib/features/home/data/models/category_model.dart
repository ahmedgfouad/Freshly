class CateroryModel {
  final String imageUrl;
  final String name;

  CateroryModel({required this.imageUrl, required this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'imageUrl': imageUrl, 'name': name};
  }

  factory CateroryModel.fromMap(Map<String, dynamic> map) {
    return CateroryModel(
      imageUrl: map['imageUrl'] as String,
      name: map['name'] as String,
    );
  }
}
