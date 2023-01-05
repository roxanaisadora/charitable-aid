import 'package:google_maps_flutter/google_maps_flutter.dart';

class HelpPoint {
  final String pointName;
  final String asset;
  final String pointAddress;
  final String schedule;
  final LatLng location;

  HelpPoint({
    required this.pointName,
    required this.asset,
    required this.pointAddress,
    required this.schedule,
    required this.location,
  });
}
