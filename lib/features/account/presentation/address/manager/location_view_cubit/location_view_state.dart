
import 'package:store/features/account/data/models/google_map_location_model.dart';

abstract class LocationViewState {}

class LocationViewInitial extends LocationViewState {}

class LocationViewLoading extends LocationViewState {}

class LocationViewLoaded extends LocationViewState {
  final GoogleMapLocationModel location;
  LocationViewLoaded(this.location);
}

class LocationViewEmpty extends LocationViewState {}

class LocationViewError extends LocationViewState {
  final String message;
  LocationViewError(this.message);
}
