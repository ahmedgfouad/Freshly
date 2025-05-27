class AddressModel {
  final String id;
  final String city;
  final String streetName;
  final String buildinNumber;
  final String nearestLandmark;
  final String phoneNumber;

  AddressModel({
    required this.id,
    required this.city,
    required this.streetName,
    required this.buildinNumber,
    required this.nearestLandmark,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'city': city,
      'streetName': streetName,
      'buildinNumber': buildinNumber,
      'nearestLandmark': nearestLandmark,
      'phoneNumber': phoneNumber,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map, documentId) {
    return AddressModel(
      id: documentId,
      city: map['city'] as String,
      streetName: map['streetName'] as String,
      buildinNumber: map['buildinNumber'] as String,
      nearestLandmark: map['nearestLandmark'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }
}
