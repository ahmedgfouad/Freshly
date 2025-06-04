
import 'package:google_maps_drawing_tools/google_maps_drawing_tools.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final CameraPosition cameraPosition;
  final Set<Marker> markers;
  LocationLoaded(this.cameraPosition, this.markers);
}

class LocationUpdated extends LocationState {
  final Set<Marker> markers;
  LocationUpdated(this.markers);
}

class LocationSaved extends LocationState {}

class LocationError extends LocationState {
  final String message;
  LocationError(this.message);
}
