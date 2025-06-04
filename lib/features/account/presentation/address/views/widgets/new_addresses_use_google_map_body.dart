import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_drawing_tools/google_maps_drawing_tools.dart';
import 'package:store/core/widgets/custom_buton.dart';
import 'package:store/features/account/presentation/address/manager/location_cubit/location_cubit.dart';
import 'package:store/features/account/presentation/address/manager/location_cubit/location_state.dart';

class NewAddressesUseGoogleMapBody extends StatelessWidget {
  const NewAddressesUseGoogleMapBody({super.key});

  @override
  Widget build(BuildContext context) {

    final locationCubit = BlocProvider.of<LocationCubit>(context);
    return BlocBuilder<LocationCubit, LocationState>(
      bloc: locationCubit,
      builder: (context, state) {
        
        if (state is LocationLoading || state is LocationInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LocationLoaded || state is LocationUpdated) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    mapType: MapType.hybrid,
                    initialCameraPosition: locationCubit.cameraPosition!,
                    markers: locationCubit.markers,
                    onTap: (latlng) => locationCubit.updateMarker(latlng),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButon(
                    text: "Save location",
                    onPressed: () {
                      locationCubit.saveLocationToHive();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          );
        } else if (state is LocationError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox();
      },
    );
  }
}
