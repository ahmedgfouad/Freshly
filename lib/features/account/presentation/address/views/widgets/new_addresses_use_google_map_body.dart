import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_drawing_tools/google_maps_drawing_tools.dart';

class NewAddressesUseGoogleMapBody extends StatefulWidget {
  const NewAddressesUseGoogleMapBody({super.key});

  @override
  State<NewAddressesUseGoogleMapBody> createState() =>
      _NewAddressesUseGoogleMapBodyState();
}

class _NewAddressesUseGoogleMapBodyState
    extends State<NewAddressesUseGoogleMapBody> {
  @override
  void initState() {
    getPer();
    getLatAndLong();
    super.initState();
  }

  late Position cl;
  var lat;
  var long;
  CameraPosition? _kGooglePlex;
  Future getPer() async {
    bool services;
    LocationPermission per;

    services = await Geolocator.isLocationServiceEnabled();

    if (services == false) {
      ScaffoldMessenger.of(
        // ignore: use_build_context_synchronously
        context,
      ).showSnackBar(SnackBar(content: Text("Servics not enabled")));
    }

    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
    }
    if (per == LocationPermission.always) {
      getLatAndLong();
    }
    return per;
  }

  Future<void> getLatAndLong() async {
    cl = await Geolocator.getCurrentPosition().then((value) => value);
    lat = cl.latitude;
    long = cl.longitude;
    _kGooglePlex = CameraPosition(target: LatLng(lat, long), zoom: 14.4746);
    setState(() {});
  }

  Future<void> getNameOfMyLocation(double latitude, double longitude) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      latitude,
      longitude,
    );
    print("the current location is : ${placemarks[0].locality}");
  }

  void getDistanceBetweenTwoPoints(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
  ) {
    double distanceInMeters = Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
    );
    print("the distance is : $distanceInMeters");
  }

  GoogleMapController? gmc;
  Set<Marker> markers = {
    Marker(
      markerId: MarkerId('1'),
      infoWindow: InfoWindow(title: '1'),
      draggable: true,
      onDragEnd: (LatLng value) {
        
      },
      position: LatLng(24.456401, 39.626061),
    ),
   
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _kGooglePlex == null
              ? CircularProgressIndicator()
              : Expanded(
                child: GoogleMap(
                  onTap: (latlng) {
                    markers.remove(Marker(markerId: MarkerId('1')));
                    markers.add(
                      Marker(markerId: MarkerId('1'), position: latlng),
                    );
                    setState(() {});
                  },
                  markers: markers,
                  mapType: MapType.hybrid,
                  initialCameraPosition: _kGooglePlex!,
                  onMapCreated: (GoogleMapController controller) {
                    gmc = controller;
                  },
                ),
              ),
          Center(
            child: ElevatedButton(
              onPressed: () async {},
              child: Text('Get Location'),
            ),
          ),
        ],
      ),
    );
  }
}


// AIzaSyCmXvQS_Tx-9538wXDV392K4He79TAoAFU