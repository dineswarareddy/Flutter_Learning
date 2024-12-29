import 'package:location/location.dart';

class LocationModel {
  final double latitude;
  final double longitude;
  final String address;

  const LocationModel({required this.latitude, required this.longitude, required this.address});
}