import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:store/features/account/data/models/google_map_location_model.dart';
import 'location_view_state.dart';

class LocationViewCubit extends Cubit<LocationViewState> {
  LocationViewCubit() : super(LocationViewInitial());

  Future<void> fetchLocation() async {
    emit(LocationViewLoading());
    try {
      var box = Hive.box('shopBox');
      final data = box.get('currentLocation');
      if (data != null) {
        final location = GoogleMapLocationModel.fromMap(Map<String, dynamic>.from(data));
        emit(LocationViewLoaded(location));
      } else {
        emit(LocationViewEmpty());
      }
    } catch (e) {
      emit(LocationViewError(e.toString()));
    }
  }
}
