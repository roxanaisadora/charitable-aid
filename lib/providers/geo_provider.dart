import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GeoProvider extends ChangeNotifier {
  bool isVisible = true;

  void activeMenu() {
    (isVisible == false) ? (isVisible = true) : (isVisible = false);
    notifyListeners();
  }

  //MAP
  StreamSubscription? streamSubscription;
  final Location _tracker = Location();
  Marker? marker;
  Circle? circle;
  GoogleMapController? googleMapController;

  CameraPosition initialPosition = const CameraPosition(
    target: LatLng(-11.9962282, -77.0100778),
    zoom: 14.475,
  );

  void updateMarker(LocationData newLocation) {
    LatLng latLng = LatLng(newLocation.latitude!, newLocation.longitude!);

    marker = Marker(
      markerId: const MarkerId('marcador'),
      position: latLng,
      rotation: newLocation.latitude!,
      draggable: false,
      zIndex: 2,
      flat: true,
      anchor: const Offset(0.5, 0.5),
      icon: BitmapDescriptor.defaultMarker,
    );

    circle = Circle(
      circleId: const CircleId('#circle'),
      radius: newLocation.accuracy!,
      zIndex: 1,
      strokeColor: Colors.lightBlue,
      center: latLng,
      fillColor: Colors.blue.withAlpha(70),
    );
  }

  void getLocationUser() async {
    try {
      var location = await _tracker.getLocation();
      updateMarker(location);
      if (streamSubscription != null) {
        streamSubscription!.cancel();
      }
      streamSubscription = _tracker.onLocationChanged.listen((event) {
        if (googleMapController != null) {
          googleMapController!.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(event.latitude!, event.longitude!),
                zoom: 18,
              ),
            ),
          );
          updateMarker(event);
          notifyListeners();
        }
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint('permission denied');
      }
    }
  }
}
