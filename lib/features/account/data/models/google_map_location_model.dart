
class GoogleMapLocationModel {
  final double latitude;
  final double longitude;

  GoogleMapLocationModel({required this.latitude, required this.longitude});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory GoogleMapLocationModel.fromMap(Map<String, dynamic> map) {
    return GoogleMapLocationModel(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  } 
}
