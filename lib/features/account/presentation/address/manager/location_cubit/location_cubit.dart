import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_drawing_tools/google_maps_drawing_tools.dart';
import 'package:hive/hive.dart';
import 'package:store/features/account/data/models/google_map_location_model.dart';
import 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  late Position _currentPosition;
  late double lat;
  late double long;
  Set<Marker> markers = {};
  CameraPosition? cameraPosition;

  Future<void> initLocation() async {
    emit(LocationLoading());
    try {
      await _getPermission();
      _currentPosition = await Geolocator.getCurrentPosition();
      lat = _currentPosition.latitude;
      long = _currentPosition.longitude;
      cameraPosition = CameraPosition(target: LatLng(lat, long), zoom: 14.4746);
      markers = {
        Marker(
          markerId: MarkerId('1'),
          position: LatLng(lat, long),
          draggable: true,
          onDragEnd: (newPosition) {
            updateMarker(newPosition);
          },
        ),
      };
      emit(LocationLoaded(cameraPosition!, markers));
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }

  void updateMarker(LatLng newPosition) {
    markers = {
      Marker(
        markerId: MarkerId('1'),
        position: newPosition,
        draggable: true,
        onDragEnd: (pos) => updateMarker(pos),
      ),
    };
    lat = newPosition.latitude;
    long = newPosition.longitude;
    emit(LocationUpdated(markers));
  }

  Future<void> saveLocationToHive() async {
    var box = Hive.box('shopBox');
    final model = GoogleMapLocationModel(latitude: lat, longitude: long);
    await box.put('currentLocation', model.toMap());
    emit(LocationSaved());
  }

  Future<void> _getPermission() async {
    bool services = await Geolocator.isLocationServiceEnabled();
    if (!services) throw Exception("Location services not enabled");

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location permission denied permanently");
    }
  }
}
